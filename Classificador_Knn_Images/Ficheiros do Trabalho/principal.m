clear all
clc

% Passo 1: Ler os dados do arquivo
data=fopen('BD1.txt','r');
 I=25;
 


% Passo 2: Definir o número de clusters (k = 3)
K = 3;

%Criar os K representantes aleatorios
i=1;

'iniciio'
while ~feof(data)
    xx=fscanf(data,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n',I); %le linhas pares de valores da BD xx(1) - primeira coord;xx(2) - segunda corod.
    for j=1:I
        x(i,j)=xx(j); %x(i,j) é coordenada j do evento 
    end
    i=i+1;
end
fclose(data);

'valores lidos'
x
N=i-1

% Gerar 3 Numeros aleatorios entre 1 e N
antigos_representante = randperm(N, 3);

% Exibe os números gerados 
disp(antigos_representante);


CP=1;
it=0;
while  CP>0.0001 && it<10
 P=calcula_particao(antigos_representante,x,K);   % calculo uma partição usando os representantes anteriores

 novos_representantes = calcula_representantes(P,x,N,K);  %calculo representantes usanso particao calculada
 CP=diferenca_representantes(antigos_representante, novos_representantes) %medida entre novos representantes e antigos
 antigos_representante = novos_representantes;
 it=it+1
end

length(novos_representantes)







% % Verificar se a matriz possui o tamanho esperado
% [m, n] = size(x);
% if n == 25
%     % Loop para exibir gráficos para cada linha
%     for i = 1:m
%         % Criar uma nova figura para cada linha
%         figure;
% 
%         % Reshape da linha atual para formar uma matriz 5x5
%         matriz_5x5 = reshape(x(i, :), 5, 5);
% 
%         % Exibir a matriz usando a função imagesc
%         imagesc(matriz_5x5);
% 
%         % Adicionar rótulos e título
%         xlabel('Coluna');
%         ylabel('Linha');
%         title(['Linha ' num2str(i)]);
% 
%         % Adicionar barra de cores
%         colorbar;
%     end
% else
%     disp('A matriz não possui 25 atributos.');
% end





% Testes
i=1;
teste2=fopen('teste2.txt','r');
while ~feof(teste2)
    yk=fscanf(teste2,'%f\n',26); %le linhas pares de valores da BD xx(1) - primeira coord;xx(2) - segunda corod.
    % Leitura de 25 posições em xx e a 26ª posição em y
    yy = yk(1:25);
    yyy = yk(26);
    if i==101
        yy
        yyy
    end
    for j=1:25
        y(i,j)=yy(j); %x(i,j) é coordenada j do evento 
    end
    v(1,i)=yyy(1);
    i=i+1;
end
fclose(teste2);
'FIM'
P=calcula_particao(novos_representantes,y,K)



% Verificar se a matriz possui o tamanho esperado
[m, n] = size(x);
if n == 25
    % Loop para exibir gráficos para cada linha
    for i = 1:length(novos_representantes)
        % Criar uma nova figura para cada linha
        figure;

        % Reshape da linha atual para formar uma matriz 5x5
        matriz_5x5 = reshape(x(novos_representantes(i), :), 5, 5);
        matriz_5x5 = imrotate(matriz_5x5, 90);
        % Exibir a matriz usando a função imagesc
        imagesc(matriz_5x5);

        % Adicionar rótulos e título
        xlabel('Coluna');
        ylabel('Linha');
        title(['Linha ' num2str(i)]);

        % Adicionar barra de cores
        colorbar;
    end
else
    disp('A matriz não possui 25 atributos.');
end





% vizualizar

for i = 1: 3
    % Criar uma nova figura para cada linha
    figure;

    % Reshape da linha atual para formar uma matriz 5x5
    matriz_5x5 = reshape(y(i,:), 5, 5);

    % Rotacionar a matriz em 90 graus para a direita
    matriz_rotacionada = imrotate(matriz_5x5, 90);

    % Exibir a matriz usando a função imagesc
    imagesc(matriz_rotacionada);

    % Adicionar rótulos e título
    xlabel('Linha');
    ylabel('Coluna');  % Inverti os rótulos para refletir a rotação
    title(['Linha ' num2str(i)]);

    % Adicionar barra de cores (opcional, remova se não for necessário)
    colorbar;
end






% Inicializar a matriz de confusão
matriz_confusao = zeros(K, K);

% Preencher a matriz de confusão manualmente
for i = 1:length(v)
    verdadeiro_classe = v(i);
    predito_classe = P(i);
    
    % Verificar a classe verdadeira e predita
    if verdadeiro_classe == 1
        if predito_classe == 1
            matriz_confusao(1, 1) = matriz_confusao(1, 1) + 1;
        elseif predito_classe == 2
            matriz_confusao(1, 2) = matriz_confusao(1, 2) + 1;
        elseif predito_classe == 3
            matriz_confusao(1, 3) = matriz_confusao(1, 3) + 1;
        end
    elseif verdadeiro_classe == 2
        if predito_classe == 1
            matriz_confusao(2, 1) = matriz_confusao(2, 1) + 1;
        elseif predito_classe == 2
            matriz_confusao(2, 2) = matriz_confusao(2, 2) + 1;
        elseif predito_classe == 3
            matriz_confusao(2, 3) = matriz_confusao(2, 3) + 1;
        end
    elseif verdadeiro_classe == 3
        if predito_classe == 1
            matriz_confusao(3, 1) = matriz_confusao(3, 1) + 1;
        elseif predito_classe == 2
            matriz_confusao(3, 2) = matriz_confusao(3, 2) + 1;
        elseif predito_classe == 3
            matriz_confusao(3, 3) = matriz_confusao(3, 3) + 1;
        end
    end
end

% Exibir a matriz de confusão
disp('Matriz de Confusão:');
disp(matriz_confusao);

% Calcular a precisão global (accuracy)
precisao_global = sum(diag(matriz_confusao)) / sum(matriz_confusao(:));
disp(['Precisão Global: ' num2str(precisao_global)]);




acertos = 0;
for i=1: length(P)
    if P(i)==v(i)
        acertos = acertos+1;
    end
end

acertos

