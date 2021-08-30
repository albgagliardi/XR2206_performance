clear variables, close all

data = load('misure.txt');
fmes = data(:,1);
ames = data(:,3);
thd_mes = data(:,2);

interpolant = scatteredInterpolant(fmes,ames,thd_mes);

fmin = min(fmes);
fmax = max(fmes);

amin = min(ames);
amax = max(ames);

% interpolation on a plane
f = logspace(log10(fmin), log10(fmax), 10);
a = linspace(amin, amax, 10);
[freq, ampl] = meshgrid(f, a);
THD = interpolant(freq, ampl);

surf(freq, ampl, THD)
view(2)
shading interp
xlabel('frequency (Hz)', 'fontsize', 14)
ylabel('amplitude (A)', 'fontsize', 14)
cb = colorbar;
t = get(cb, 'title');
set(t, 'String', 'THD (%)');
set(gca, 'color', [1 1 1], 'fontsize',16)
set(gca, 'clim', [-inf inf], 'xlim', [-inf inf], 'ylim', [-inf inf])


% interpolation on a line
a = 0.:0.3:2.2;
leg = {};
for k = 1:length(a)
    freq = logspace(log10(fmin), log10(fmax), 20);
    ampl = a(k) * ones(size(freq));
    THD = interpolant(freq, ampl);
    leg{k} = ['A = ', num2str(a(k)), ' V'];
    if k == 1
        figure;
        set(gca, 'color', [1 1 1], 'fontsize',16)
    elseif k == 2
        hold on
    end
    
    semilogx(freq, THD, 'linewidth',2)
    if k == 1
        xlabel('frequency (Hz)', 'fontsize', 14)
        ylabel('THD (%)', 'fontsize', 14)
    end
end
set(gca, 'xlim', [-inf inf])
legend(leg);