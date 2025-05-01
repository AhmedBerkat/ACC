%% Définir les paramètres de la simulation
clear; close all; clc

% Définir la période d'échantillonnage, Ts, et la durée de la simulation, T, en secondes
Ts = 0.1;    % période d'échantillonnage de 0.1 sec
T = 80;      % durée de la simulation de 80 sec

% Spécifier le modèle linéaire pour la voiture ego
G_ego = tf(1, [0.5, 1, 0]);

% Définir la position et la vitesse initiale pour les deux véhicules
x0_lead = 50;  % position initiale du véhicule de tête (50 m)
v0_lead = 25;  % vitesse initiale du véhicule de tête (25 m/s)      
x0_ego = 10;   % position initiale du véhicule ego (10 m)
v0_ego = 20;   % vitesse initiale du véhicule ego (20 m/s)

% La distance de sécurité entre le véhicule de tête et le véhicule ego est une fonction
% de la vitesse du véhicule ego
t_gap = 1.5;  % Gap de temps = 1.5 sec
D_default = 10;  % Distance par défaut = 10 m

% Spécifier la vitesse de consigne du conducteur (en m/s)
v_set = 30;  % vitesse de consigne = 30 m/s

% Compte tenu des limitations physiques de la dynamique du véhicule, 
% l'accélération est contrainte dans la plage [-3, 2] (m/s^2)
amin_ego = -3;  % accélération minimum ego = -3 m/s^2
amax_ego = 2;   % accélération maximum ego = 2 m/s^2

%% Exécuter la simulation
sim('ACCmpcsystem');  % Exécute le modèle Simulink 'ACCmpcsystem'

%% Ouvrir le modèle Simulink
open_system('ACCmpcsystem');  % Ouvre le modèle Simulink 'ACCmpcsystem'

%% Tracer les résultats de la simulation
% Appel de la fonction pour tracer les résultats
ACCmpcplot(logsout, D_default, t_gap, v_set);
