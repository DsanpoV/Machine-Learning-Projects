function d = calcula_dissemelhanca(x_R, x_i)
    % METRICA EUCLIDIANA
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Mx=[mx1 mx2] My=[my1 my2]
    % x é um array com 2 coordenadas
    % d(i,j) tem a distância do evento i ao representante j

    % Métrica de dissimilaridade (contagem de elementos diferentes)
    d = sum(x_R ~= x_i);
    %Métrica de semelhança( contagem de elementos que são comummente 1)
    %d = sum(x_R & x_i);
end
