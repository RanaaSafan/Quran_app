import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/quran/data/models/quran_edition.dart';
import '../../../../core/functions/api_service.dart';
import '../../data/models/surah_datas.dart';
import '../../data/repo/Repo_surah_impl.dart';

class ContainerSurah extends StatefulWidget {
  const ContainerSurah({super.key, required this.data, required this.quran});
  final SurahDatas data;
  final QuranEdition quran;

  @override
  State<ContainerSurah> createState() => _ContainerSurahState();
}

class _ContainerSurahState extends State<ContainerSurah> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false; // To manage play/pause state
  int? currentlyPlayingSurah; // To track which surah is currently playing

  Future<void> playAllAyahAudios() async {
    // Stop any currently playing audio when switching surahs
    if (currentlyPlayingSurah != null && currentlyPlayingSurah != widget.data.number) {
      await _audioPlayer.stop();
      setState(() {
        isPlaying = false; // Reset playing state
      });
    }

    final apiService = ApiService(dio: Dio());
    final repoSurah = RepoSurahImpl(apiservice: apiService);

    // Fetching the Surah audio data
    final result = await repoSurah.FetchSurahAudio(widget.data.number,widget.quran.identifier);
    result.fold(
          (failure) {
        print('Error: ${failure.toString()}');
      },
          (surahData) async {
        if (surahData.ayahs != null && surahData.ayahs!.isNotEmpty) {
          for (int i = 0; i < surahData.ayahs!.length; i++) {
            String? audioUrl = surahData.ayahs![i].audioSecondary?.isNotEmpty == true
                ? surahData.ayahs![i].audioSecondary![0]
                : null;

            if (audioUrl != null) {
              try {
                await _audioPlayer.setUrl(audioUrl);
                await _audioPlayer.play();
                setState(() {
                  isPlaying = true;
                  currentlyPlayingSurah = widget.data.number; // Update currently playing surah
                });

                // Wait for the current audio to complete
                await _audioPlayer.playerStateStream.firstWhere(
                      (state) => state.processingState == ProcessingState.completed,
                );
              } catch (e) {
                print('Error playing audio: $e');
              }
            } else {
              print('No audio URL found for Ayah $i');
            }
          }
        } else {
          print('No ayah audio available');
        }
      },
    );
  }

  void toggleAudio() async {
    if (isPlaying) {
      // Stop audio if currently playing
      await _audioPlayer.stop();
      setState(() {
        isPlaying = false; // Update playing state
      });
    } else {
      // If currently stopped, play audio
      await playAllAyahAudios(); // Wait for the audio to be set and played
      setState(() {
        isPlaying = true; // Update playing state after starting to play
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFF0A2060),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                      size: 30, color: Colors.blue),
                  onPressed: toggleAudio, // Toggle play/pause on press
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.data.name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
