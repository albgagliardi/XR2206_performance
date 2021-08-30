clear variables, close all, clear all

vett=zeros(171,5);
z=1;
%% load data
for i=1:171
    if (i<10) 
         data = load(strcat('C1Trace0000',num2str(i),'.dat') );
    else    
        if(i<100)
            data = load(strcat('C1Trace000',num2str(i),'.dat') );
        else
            data = load(strcat('C1Trace00',num2str(i),'.dat') );
        end
    end
t = data(:,1);
signal = data(:,2);
signal = signal - sum(signal)/length(signal);
camb=abs(max(signal)-abs(min(signal)));
vett(i,5)=camb;
if abs(max(signal)-abs(min(signal)))<0.1;
    A=max(signal)+abs(min(signal))/2;
    vett(z,3)=A;
    %% plot ogirinal signal
    %h1 = figure;
    %plot(t, signal);
    %hold on

    %% remove mean value
    mean_value = sum(signal) / length(signal);
    signal = signal - mean_value;

    %% truncation
    toll = max(signal) * 1e-2;
    idx = find(abs(signal) < toll);
    %plot(t(idx), signal(idx), 'bo')

    istart = idx(1);
    iend = idx(end);

    t = t(istart:iend);
    signal = signal(istart:iend);

    %plot(t, signal, 'k', 'linewidth',2)

    %% FFT
    [~, ~, f, S] = fftanalysis(t, signal);

    %% clean spectrum
    S(abs(S) < max(abs(S))*1/100) = 0; 

    %figure;
    %%stem(f, abs(S),'linewidth',2)
    %set(gca,'fontsize', 23, 'xlim', [1 3000],'yscale','log')
    %    'xticklabel',{'1', '10', '100', '300', '2k', '4k'},'xscale','log','yscale','log')
    %legend('RT = 0 ms','RT = 10 ms','RT = 20 ms','RT = 30 ms')
    %xlabel('frequency (Hz)')
    %ylabel('signal (V)')
    [m,k]=max(abs(S));
    vett(z,1)=f(k);
    S=flipud(sort((abs(S))));
    armonica_2(z)=S(2);
    armonica_3(z)=S(3);
    errore= sqrt(armonica_2(z)^2+armonica_3(z)^2)*100/S(1);
    vett(z,2)=errore;
    vett(z,4)=i;
    z=z+1;
     
end
end
filename = 'concl.xlsx'
writematrix(vett,filename,'Sheet',5,'Range','A1:I1000')

