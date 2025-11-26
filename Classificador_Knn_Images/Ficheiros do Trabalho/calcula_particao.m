function P = calcula_particao(linha_do_representante, x, K)
    N = length(x); % Número de elementos da BD

    % Inicializa a matriz de dissimilaridades
    d = zeros(K, N);
    % Para todos os eventos, calcula a dissimilaridade entre o evento e os representantes
    for i = 1:K % para todos os eventos
        for j = 1:N % para todas os clusters
            % d(i,j) deve ser a dissimilaridade do evento i ao representante j
            d(i,j) = calcula_dissemelhanca(x(linha_do_representante(i), :), x(j, :)); % x(i,:) corresponde a 1 array com 2 coordenadas de x do even
        end
    end

    % Exibe a matriz de dissimilaridades
    disp('Matriz de Dissimilaridades:');
    disp(d);

    % Constrói a partição com base nas dissimilaridades
    P = constroi_particao(d, N, K); % P contém lista de índices dos representantes para cada evento da BD
end