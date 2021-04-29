import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MovieWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.elo7.com.br/product/original/23646C7/big-poster-filme-capita-marvel-tamanho-90x60-cm-presente-geek.jpg',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Captain Marvel',
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 5),
          Text(
            'Release date: 07/03/2020',
            style: AppTextStyles.bodyBold,
          ),
          SizedBox(height: 20),
          Text(
            'Plot',
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 5),
          Text(
            'Capitã Marvel, parte do exército de elite dos Kree, uma raça alienígena, encontra-se no meio de uma batalha entre seu povo e os Skrulls. Ao tentar impedir uma invasão de larga escala na Terra, em 1995, ela tem memórias recorrentes de uma outra vida, como Carol Danvers, agente da Força Aérea norte-americana. Com a ajuda de Nick Fury, Capitã Marvel precisa descobrir os segredos de seu passado e pôr um fim ao conflito intergalático com os Skrulls.',
            style: AppTextStyles.body,
            textAlign: TextAlign.justify,
          ),
        ],
      );
  }
}