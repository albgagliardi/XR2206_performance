# XR2206_performance

Questo codice ha l'obiettivo di valutare le prestazioni del generatore di onde sinusoidali XR2206CP attraverso matlab.

I file presenti nella cartella sono:
- waves_acquisition.m  nel quale è presente la procedura di acquisizione dati partendo da un file .date  selezionare un numero intero di periodi all'interno dell'onda questa procedura è neccessaria per applicare la trasformata di fourier ed individuare le frequenze delle onde. Il Risultato di questo codice è rappresentato dal vettore bidimensionale vett che contiene per ogni onda ampiezza frequenza e THD;
- misure.txt dove sono riassunti i risultati di waves_acquisition;
- make_plot.m  consente di creare  grafici adeguati;

