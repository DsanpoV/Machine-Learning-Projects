function novos_representante = calcula_representantes(P,x,N,K)

%percorre a lista da particao e quando o indice e 1 "cria" classe 1
%quando é 2 "cria" classe 2
%depois para cada classe calcula média das coordenadas 1 dos elementos
%da classe e coordenada 2 dos elementos da classe

%retorna coordenadas x dos representantes em Mx_new e de y em My_new
%inicializacoes
d = zeros(1, N);
P
for i=1:K %para todos os clusters
  for j=1:N  %para todos os elementos da BD
    if P(1,j)==i
        for l = 1:N % para todas os clusters
            % d(i,j) deve ser a dissimilaridade do evento i ao representante j
            d(j) = d(j) + calcula_dissemelhanca(x(j, :), x(l, :)); % x(i,:) corresponde a 1 array com 2 coordenadas de x do evento 
        end
    end
    
  end
  menor = 10000 * ones(1, 3);
  novos_representantes = zeros(1, K);
  for i=1:K     
      for j=1:N
            if P(1, j)==i && d(j)<menor(i)
              novos_representantes(i)=j;
              menor(i) = d(j);
            end
      end
  end
  novos_representante=novos_representantes;
end
