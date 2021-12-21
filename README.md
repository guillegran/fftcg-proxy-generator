# fftcg-proxy-generator
A proxy generator for FFTCG cards

This bash script generates a PDF file with Final Fantasy: Trading Card Game cards from a list in a text file. 

## How to use

1. Create a .txt file with a list of the cards you wish to include, with the following rules:
	1. You only must include the *full card code*. For example, for the card Cloud (15-139S), you only must write `15-139S` in the text file. 
	1. Each card must appear in a separate line. 
	1. You must include *one line for each copy of the card* that you wish to appear in the PDF.
See the file `sample_cardlist.txt` for an example of a list of cards (this is the list of cards of the Opus 15 AVALANCHE Starter Deck).

1. Concede run permissions to the file `generator.sh`. You can put the following line in your terminal:
    ```
    $ chmod +x generator.sh
    ```

1. Run the script with your card list as input file. For example, for the card list `sample_cardlist.txt`:
    ```
    $ ./generator.sh sample_cardlist.txt
    ```

1. The output file `proxies.pdf` will appear in the working directory.

## How to change the language

By default the proxies will be generated in English. However, there are other languages available. In order to change it, you just have to edit the file `generator.sh` and change the line

    ```
    language="eg"
    ```
to your desired languages. Available options are English (eg), German (de), Spanish (es), French (fr) and Italian (it). For example, if you want to choose Spanish, you can change the above line by

    ```
    language="es"
    ```
