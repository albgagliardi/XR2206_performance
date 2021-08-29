# XR2206_performance

Questo codice ha l'obiettivo di valutare le prestazioni del generatore di onde sinusoidali XR2206CP attraverso matlab.

I file presenti nella cartella sono:
- waves_acquisition.m  nel quale è presente la procedura di acquisizione dati partendo da un file .dat
- waves_truncation.m  il quale contiene le stringhe di codice necessarie per selezionare un numero intero di periodi all'interno dell'onda
- waves_fft_analysis.m  attraverso il cui codice è possibile applicare la trasformata di fourier ed individuare le frequenze delle onde
- THD_graphs.m  consente di creare  grafici adeguati

