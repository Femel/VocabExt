﻿using System.Collections.Generic;
using System.Windows;
using VX.Domain;
using VX.Domain.Interfaces;

namespace VX.Desktop
{
    public partial class TranslationsBaloon
    {
        public TranslationsBaloon()
        {
            InitializeComponent();
        }

        private void UserControlLoaded(object sender, RoutedEventArgs e)
        {
            translationsList.ItemsSource = GetTranslations();
            wordToTranslate.Content = GetTask().Spelling;
        }

        private static IWord GetTask()
        {
            return new Word
            {
                Id = 1,
                Spelling = "Dog",
                Transcription = "Dog"
            };
        }

        private static IEnumerable<IWord> GetTranslations()
        {
            IList<IWord> words = new List<IWord>();
            words.Add(new Word
            {
                Spelling = "Cat",
                Transcription = "Cat"
            });
            words.Add(new Word
            {
                Spelling = "Dog",
                Transcription = "Dog"
            });
            words.Add(new Word
            {
                Spelling = "Cow",
                Transcription = "Cow"
            });

            return words;
        }

        private void translationsList_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {

        }
    }
}
