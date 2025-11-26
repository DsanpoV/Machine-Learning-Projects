
function CP=diferenca_representantes(antigos_representante, novos_representantes)

% verifica variacao das coordenadas dos representantes.
% podera ser por exemplo a soma da distancia de (Mx,My) a (Mx_new,My_new)
% para todos os representantes
 CP=sum(antigos_representante ~= novos_representantes);
 
end