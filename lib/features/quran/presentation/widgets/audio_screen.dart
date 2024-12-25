import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/functions/api_service.dart';
import '../../data/models/model_edition_surah/quran_edition.dart';
import '../../data/models/model_surah_names/surah_datas.dart';
import '../../data/repo/Repo_surah_impl.dart';

class AudioScreen extends StatefulWidget {
  final SurahDatas data;
  final QuranEdition quran;
  const AudioScreen({super.key, required this.data, required this.quran});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false; // To manage play/pause state
  int? currentlyPlayingSurah; // To track which surah is currently playing

  Future<void> playAllAyahAudios() async {
    // Stop any currently playing audio when switching surahs
    if (currentlyPlayingSurah != null &&
        currentlyPlayingSurah != widget.data.number) {
      await _audioPlayer.stop();
      setState(() {
        isPlaying = false; // Reset playing state
      });
    }

    final apiService = ApiService(dio: Dio());
    final repoSurah = RepoSurahImpl(apiservice: apiService);

    // Fetching the Surah audio data
    final result = await repoSurah.FetchSurahAudio(
        widget.data.number, widget.quran.identifier);
    result.fold(
      (failure) {
        print('Error: ${failure.toString()}');
      },
      (surahData) async {
        if (surahData.ayahs != null && surahData.ayahs!.isNotEmpty) {
          for (int i = 0; i < surahData.ayahs!.length; i++) {
            String? audioUrl =
                surahData.ayahs![i].audioSecondary?.isNotEmpty == true
                    ? surahData.ayahs![i].audioSecondary![0]
                    : null;

            if (audioUrl != null) {
              try {
                await _audioPlayer.setUrl(audioUrl);
                await _audioPlayer.play();
                setState(() {
                  isPlaying = true;
                  currentlyPlayingSurah =
                      widget.data.number; // Update currently playing surah
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
    return Scaffold(
      body: Stack(
        // Wrap everything inside a Stack
        children: [
          // Add other widgets here if needed

          Image(
            image: AssetImage('assets/qu3.png'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,),
            onPressed: () => Navigator.pop(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.black45.withOpacity(0.6),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.data.name,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.skip_previous,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(
                              isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_filled,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed:
                                toggleAudio, // Toggle play/pause on press
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.skip_next,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.stop(); // Stop the audio player
    _audioPlayer.dispose();
    super.dispose();
  }
}
