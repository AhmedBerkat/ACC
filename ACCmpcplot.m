function ACCmpcplot(logsout, D_default, t_gap, v_set)
    %% Obtenir les données de la simulation
    a_ego = logsout.getElement('a_ego');             % accélération de la voiture ego
    v_ego = logsout.getElement('v_ego');             % vitesse de la voiture ego
    a_lead = logsout.getElement('a_lead');           % accélération de la voiture de tête
    v_lead = logsout.getElement('v_lead');           % vitesse de la voiture de tête
    d_rel = logsout.getElement('d_rel');             % distance réelle
    d_safe = D_default + t_gap * v_ego.Values.Data;  % distance de sécurité

    %% Tracer les résultats

    % Accélération
    figure; % Création d'une figure séparée
    plot(a_ego.Values.time, a_ego.Values.Data, 'r', ...
         a_lead.Values.time, a_lead.Values.Data, 'b');
    grid on;
    ylim([-3.2, 2.2]); % Échelle adaptée pour les accélérations
    legend('Ego car', 'Lead car', 'Location', 'SouthEast');
    title('Acceleration');
    xlabel('Time (sec)');
    ylabel('$m/s^2$', 'Interpreter', 'latex');

    % Vitesse
    figure; % Création d'une figure séparée
    plot(v_ego.Values.time, v_ego.Values.Data, 'r', ...
         v_lead.Values.time, v_lead.Values.Data, 'b', ...
         v_lead.Values.time, v_set * ones(length(v_lead.Values.time), 1), 'k--');
    grid on;
    ylim([0, 100]); % Échelle adaptée pour des vitesses allant jusqu'à 100
    legend('Ego car', 'Lead car', 'Set value', 'Location', 'SouthEast');
    title('Velocity');
    xlabel('Time (sec)');
    ylabel('$m/s$', 'Interpreter', 'latex');

    % Distance
    figure; % Création d'une figure séparée
    plot(d_rel.Values.time, d_rel.Values.Data, 'r', ...
         d_rel.Values.time, d_safe, 'b');
    grid on;
    legend('Actual distance', 'Safe distance', 'Location', 'SouthEast');
    title('Distance Between Two Cars');
    xlabel('Time (sec)');
    ylabel('$m$', 'Interpreter', 'latex');
end
