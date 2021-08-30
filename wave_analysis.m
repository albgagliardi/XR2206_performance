clear variables, close all

%% load data
data = load('C1Trace00001.dat'); 
t = data(:,1);
signal = data(:,2);

%% plot ogirinal signal
h1 = figure;
plot(t, signal)
ylabel('signal (V)')
hold on

%% remove mean value
mean_value = sum(signal) / length(signal);
signal = signal - mean_value;

%% truncation
toll = max(signal) * 1e-2;
idx = find(abs(signal) < toll);
plot(t(idx), signal(idx), 'bo')

istart = idx(1);
iend = idx(end);
t = t(istart:iend);
signal = signal(istart:iend);
plot(t, signal, 'k', 'linewidth',2)

%% FFT
[~, ~, f, S] = fftanalysis(t, signal);

% clean spectrum
S(abs(S) < max(abs(S))*1/100) = 0; 

figure;
stem(f, abs(S),'linewidth',2)
set(gca,'fontsize', 17, 'xlim', [1 1000],'yscale','log','ylim',[0.01 2])
xlabel('frequency (Hz)')
ylabel('signal (V)')
grid on
S=flipud(sort((abs(S))));
armonica_2(i)=S(2);
armonica_3(i)=S(3);
errore(i)= sqrt(armonica_2(i)^2+armonica_3(i)^2)*100/S(1);
S(1);
