function P=constroi_particao(d,N,K)
% d(i,j) - tem distancia de evento i ao representante j; N e numero de
% eventos; K numero de representantes

% para todos os eventos
% para todos os representantes
% ve qual a distancia minima do evento ao representante
% atribui a posicao i da particao o indice do representante mais proximo

  for j=1:N
        if d(1,j) <= d(2,j) && d(1,j) < d(3,j)
          P(j)=2;
        end
        if d(2,j)< d(1,j) && d(2,j) < d(3,j)
          P(j)=1;
        end
        if d(3,j)<= d(1,j) && d(3,j) <= d(2,j)
          P(j)=3;
        end
  end
 
end