% Hybrid_Renewable_Integration.m
% Author: Alfonso Davila Vera
% Date: October 07, 2025
% Description: Simulates integration of solar PV and wind energy into a power system.
% Inputs: Environmental data (irradiance, temperature, wind speed).
% Outputs: Power curves, total energy, efficiency metrics.

clear; clc; close all;

% System Parameters (Customizable based on real projects)
% Solar PV Parameters
PV_rated_power = 5;          % Rated power of PV array (kW)
PV_efficiency = 0.18;        % Module efficiency
PV_area = PV_rated_power / (PV_efficiency * 1);  % Area in m² (assuming 1 kW/m² STC)
PV_temp_coeff = -0.004;      % Temperature coefficient (/°C)
PV_ref_temp = 25;            % Reference temperature (°C)
MPPT_efficiency = 0.98;      % Approximate MPPT efficiency

% Wind Turbine Parameters
Wind_rated_power = 3;        % Rated power (kW)
Wind_cut_in = 3;             % Cut-in wind speed (m/s)
Wind_rated_speed = 12;       % Rated wind speed (m/s)
Wind_cut_out = 25;           % Cut-out wind speed (m/s)
Air_density = 1.225;         % kg/m³
Rotor_diameter = 10;         % m
Cp_max = 0.45;               % Max power coefficient (Betz limit ~0.59, practical 0.45)

% Sample Environmental Data (24-hour profile; replace with real data)
hours = 0:23;
irradiance = [0, 0, 0, 0, 0, 200, 400, 600, 800, 1000, 1000, 900, 800, 700, 600, 500, 400, 300, 200, 100, 0, 0, 0, 0];  % W/m²
temperature = [20, 19, 18, 18, 19, 20, 22, 25, 28, 30, 32, 33, 32, 30, 28, 25, 23, 22, 21, 20, 19, 18, 18, 17];  % °C
wind_speed = [5, 6, 7, 6, 5, 4, 5, 6, 7, 8, 9, 10, 11, 10, 9, 8, 7, 6, 5, 4, 5, 6, 7, 6];  % m/s

% Calculate Solar PV Power
PV_power = zeros(size(hours));
for i = 1:length(hours)
    if irradiance(i) > 0
        % Basic PV power equation with temperature correction
        temp_factor = 1 + PV_temp_coeff * (temperature(i) - PV_ref_temp);
        PV_power(i) = PV_area * irradiance(i)/1000 * PV_efficiency * temp_factor * MPPT_efficiency;
    end
end

% Calculate Wind Power
Wind_power = zeros(size(hours));
rotor_area = pi * (Rotor_diameter/2)^2;
for i = 1:length(hours)
    v = wind_speed(i);
    if v >= Wind_cut_in && v < Wind_rated_speed
        Wind_power(i) = 0.5 * Air_density * rotor_area * v^3 * Cp_max;
    elseif v >= Wind_rated_speed && v < Wind_cut_out
        Wind_power(i) = Wind_rated_power;
    end
    Wind_power(i) = min(Wind_power(i), Wind_rated_power);  % Cap at rated
end

% Total Integrated Power (Hybrid)
Total_power = PV_power + Wind_power;

% Efficiency and Energy Yield
Total_energy = trapz(hours, Total_power);  % kWh (integral over time)
System_efficiency = (Total_energy / (sum(irradiance)/1000 * PV_area + sum(0.5 * Air_density * rotor_area * wind_speed.^3 * Cp_max))) * 100;  % Approximate %

% Grid Contribution Estimate (Assume 80% fed to grid after losses/self-use)
Grid_feed_in = Total_power * 0.8;

% Display Results
fprintf('Total Daily PV Energy: %.2f kWh\n', trapz(hours, PV_power));
fprintf('Total Daily Wind Energy: %.2f kWh\n', trapz(hours, Wind_power));
fprintf('Total Hybrid Energy: %.2f kWh\n', Total_energy);
fprintf('System Efficiency: %.2f%%\n', System_efficiency);

% Visualization
figure;
subplot(3,1,1);
plot(hours, PV_power, 'b-', 'LineWidth', 2); hold on;
plot(hours, Wind_power, 'g-', 'LineWidth', 2);
plot(hours, Total_power, 'r--', 'LineWidth', 2);
xlabel('Time (hours)'); ylabel('Power (kW)');
legend('PV Power', 'Wind Power', 'Total Hybrid');
title('Hybrid Renewable Energy Power Output');

subplot(3,1,2);
plot(hours, Grid_feed_in, 'm-', 'LineWidth', 2);
xlabel('Time (hours)'); ylabel('Power (kW)');
title('Estimated Grid Feed-In');

subplot(3,1,3);
bar(hours, [PV_power; Wind_power]', 'stacked');
xlabel('Time (hours)'); ylabel('Power (kW)');
legend('PV', 'Wind');
title('Stacked Contribution');

% Save results to CSV for MEP integration (e.g., import to Revit/Dynamo)
results = [hours', PV_power', Wind_power', Total_power', Grid_feed_in'];
csvwrite('hybrid_energy_output.csv', results);
disp('Results saved to hybrid_energy_output.csv');