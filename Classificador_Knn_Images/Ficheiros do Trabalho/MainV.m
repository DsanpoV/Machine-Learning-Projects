clear all
clc

%%% PASSO 1:Abrir os dados do arquivo
data=fopen('BD1.txt','r');
 I=25;

%%% PASSO 2:Definir o número de clusters(k = 3)(seria interessante mudar k) 
K = 3;

%%% PASSO 3:Ler os dados do arquivo e criar uma matriz com eles
i=1;
while ~feof(data)
    xx=fscanf(data,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n',I);
    for j=1:I
        x(i,j)=xx(j); %x(i,j) é coordenada j do evento 
    end
    i=i+1;
end
fclose(data);
x; %%% matriz criada
N=i-1; %numero de imagens

                  %%%%%%%%%%%%% PLOT DE DADOS %%%%%%%%%%%
%[m, n] = size(x);
%    % Loop para exibir gráficos para cada linha
 %   for i = 1:m
  %      % Criar uma nova figura para cada linha
   %     figure;
    %    % Reshape da linha atual para formar uma matriz 5x5
     %   vetorsimbolo=x(i, :);
      %  imagemSimbolo=vetorsimbolo(end:-1:1);
       % matriz_5x5 = reshape(imagemSimbolo, 5, 5);
%
        % Exibir a matriz usando a função imagesc de maneira a que as
        % imagens fiquem viradas de pé
 %       imagesc(transpose(flipud(matriz_5x5)));
  %  end

               %%%%%%%%%% ALGORITMO DE LLOYD %%%%%%%%%%%%%%

% Gerar 3 Numeros aleatorios entre 1 e N
%antigos_representante = randperm(N, 3);
antigos_representante = [9 12 23];

% Exibe os números gerados 
disp(antigos_representante)

CP=1;
it=0;
while  CP>0.0001 && it<10
 P=calcula_particao(antigos_representante,x,K);   % calculo uma partição usando os representantes anteriores

 novos_representantes = calcula_representantes(P,x,N,K);  %calculo representantes usanso particao calculada
 CP=diferenca_representantes(antigos_representante, novos_representantes) %medida entre novos representantes e antigos
 antigos_representante = novos_representantes;
 it=it+1;
end

length(novos_representantes)
novos_representantes

%%%%%%%%%%%%%%%% Teste 1 %%%%%%%%%%%%%%%%%%%%

i=1;
teste=fopen('teste.txt','r');
while ~feof(teste)
    linhasTeste1=fscanf(teste,'%f\n',26);
    entradasimagem1 = linhasTeste1(1:25);
    ClustersDado1 = linhasTeste1(26);
    if i==101
        entradasimagem1
        ClustersDado1
    end
    for j=1:25
        M1(i,j)=entradasimagem1(j); %x(i,j) é coordenada j do evento 
    end
    v(1,i)=ClustersDado1(1);
    i=i+1;
end
fclose(teste);

%%%%%%%%%%%%%%%%%% Classificação Teste 1 %%%%%%%%%%%%%
ListaPercentagensteste1=[]; %iniciar listas para comparar diferencentes k vizinhos

for U=1:15;
KnnTeste1=knn_predict(x,P,M1,U);

%%%%%%%%%%%%%%%%%% MATRIZ DE CONFUSÃO Teste 1 %%%%%%%%%%%%%%%%%
 matriz_confusao1 = zeros(K, K);
for i = 1:length(M1)
    classe_teste = v(i);
    classe_prevista = KnnTeste1(i);
%cada vez que um destes casos acontece adicionamos 1 na entrada desse caso na matriz de confusao    

if classe_teste == 1
        if classe_prevista == 1
            matriz_confusao1(1, 1) = matriz_confusao1(1, 1) + 1;
        elseif classe_prevista == 2
            matriz_confusao1(1, 2) = matriz_confusao1(1, 2) + 1;
        elseif classe_prevista == 3
            matriz_confusao1(1, 3) = matriz_confusao1(1, 3) + 1;
        end
    elseif classe_teste == 2
        if classe_prevista == 1
            matriz_confusao1(2, 1) = matriz_confusao1(2, 1) + 1;
        elseif classe_prevista == 2
            matriz_confusao1(2, 2) = matriz_confusao1(2, 2) + 1;
        elseif classe_prevista == 3
            matriz_confusao1(2, 3) = matriz_confusao1(2, 3) + 1;
        end
    elseif classe_teste == 3
        if classe_prevista == 1
            matriz_confusao1(3, 1) = matriz_confusao1(3, 1) + 1;
        elseif classe_prevista == 2
            matriz_confusao1(3, 2) = matriz_confusao1(3, 2) + 1;
        elseif classe_prevista == 3
            matriz_confusao1(3, 3) = matriz_confusao1(3, 3) + 1;
        end
    end
end
%disp(matriz_confusao1);
% Calcular a precisão global (accuracy)
precisao_global1 = sum(diag(matriz_confusao1)) / sum(matriz_confusao1(:));
disp(['Precisão Global do teste 1 com ' num2str(U) ' vizinhos proximos é: ' num2str(precisao_global1)]);
ListaPercentagensteste1(end + 1) = precisao_global1;
end

Knnbest1=knn_predict(x,P,M1,8);
confusion_chart=confusionchart(Knnbest1,v);
confusion_chart.Title = 'Matriz de confusão relativa a 8 vizinhos(1)';
drawnow;

keyboard;
kvizinhos = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
plot(kvizinhos, ListaPercentagensteste1, 'o-', 'LineWidth', 2);

% Add labels and title
xlabel('Nr de K Vizinhos');
ylabel('Precisão Global');
title('Precisão Global vs. Nr de K Vizinhos');
grid on;
keyboard;
 %%%%%%%%%%%%%%%  Teste 2 %%%%%%%%%%%%%%%%%%%

i=1;
teste2=fopen('teste2.txt','r');
while ~feof(teste2)
    linhasTeste2=fscanf(teste2,'%f\n',26);
    entradasimagem = linhasTeste2(1:25);
    ClustersDado = linhasTeste2(26);
    if i==101
        entradasimagem;
        ClustersDado;
    end
    for j=1:25
        M2(i,j)=entradasimagem(j); %x(i,j) é coordenada j do evento 
    end
    v(1,i)=ClustersDado(1);
    i=i+1;
end
fclose(teste2);

%%%%%%%%%%%%%%%%%% Classificação Teste 2 %%%%%%%%%%%%%
ListaPercentagens=[]; %iniciar listas para comparar diferencentes k vizinhos
for T=1:15;
KNNteste2=knn_predict(x,P,M2,T);


%%%%%%%%%%%%%%%%%% MATRIZ DE CONFUSÃO Teste 2 %%%%%%%%%%%%%%%%%
 matriz_confusao2 = zeros(K, K);
for i = 1:length(M2)
    classe_teste = v(i);
    classe_prevista = KNNteste2(i);
%cada vez que um destes casos acontece adicionamos 1 na entrada desse caso na matriz de confusao    

if classe_teste == 1
        if classe_prevista == 1
            matriz_confusao2(1, 1) = matriz_confusao2(1, 1) + 1;
        elseif classe_prevista == 2
            matriz_confusao2(1, 2) = matriz_confusao2(1, 2) + 1;
        elseif classe_prevista == 3
            matriz_confusao2(1, 3) = matriz_confusao2(1, 3) + 1;
        end
    elseif classe_teste == 2
        if classe_prevista == 1
            matriz_confusao2(2, 1) = matriz_confusao2(2, 1) + 1;
        elseif classe_prevista == 2
            matriz_confusao2(2, 2) = matriz_confusao2(2, 2) + 1;
        elseif classe_prevista == 3
            matriz_confusao2(2, 3) = matriz_confusao2(2, 3) + 1;
        end
    elseif classe_teste == 3
        if classe_prevista == 1
            matriz_confusao2(3, 1) = matriz_confusao2(3, 1) + 1;
        elseif classe_prevista == 2
            matriz_confusao2(3, 2) = matriz_confusao2(3, 2) + 1;
        elseif classe_prevista == 3
            matriz_confusao2(3, 3) = matriz_confusao2(3, 3) + 1;
        end
    end
   end 
%disp(matriz_confusao2);
%%%%%%%%%%%%%%%%%%%% F1 Score %%%%%%%%%%%%%%%%%%
precision = zeros(3, 1);
recall = zeros(3, 1);
f1_score = zeros(3, 1);

for i = 1:3
    true_positive = matriz_confusao2(i, i);
    false_positive = sum(matriz_confusao2(:, i)) - true_positive;
    false_negative = sum(matriz_confusao2(i, :)) - true_positive;

    % Calculate precision, recall, and F1 for each class
    precision(i) = true_positive / (true_positive + false_positive);
    recall(i) = true_positive / (true_positive + false_negative);
    
    % Avoid division by zero for precision or recall equal to zero
    if precision(i) + recall(i) == 0
        f1_score(i) = 0;
    else
        f1_score(i) = 2 * (precision(i) * recall(i)) / (precision(i) + recall(i));
    end
end

% Calculate macro-average F1 score
macro_average_f1 = mean(f1_score);
disp(['Macro-average F1 Score: ', num2str(macro_average_f1)]);

% Calcular a precisão global (accuracy)
precisao_global2 = sum(diag(matriz_confusao2)) / sum(matriz_confusao2(:));
disp(['Precisão Global do teste 2 com ' num2str(T) ' vizinhos proximos é: ' num2str(precisao_global2)]);
ListaPercentagens(end + 1) = precisao_global2;
end

Knnbest2=knn_predict(x,P,M2,7);
confusion_chart=confusionchart(Knnbest2,v);
confusion_chart.Title = 'Matriz de confusão relativa a 7 vizinhos(0.8727)';
drawnow;
keyboard;

%%%%%%%%%%%%%%%%%%%%%%%% Representação visual das iteraçoes vs accuracy de
%%%%%%%%%%%%%%%%%%%%%%%% k vizinhos

kvizinhos = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
plot(kvizinhos, ListaPercentagens, 'o-', 'LineWidth', 2);

% Add labels and title
xlabel('Nr de K Vizinhos');
ylabel('Precisão Global');
title('Precisão Global vs. Nr de K Vizinhos');
grid on;

%%%%%representante mais proximo%%%%%
for i=1:length(M2)
    d1=calcula_dissemelhanca(x(novos_representantes(1), :),M2(i,:));
    d2=calcula_dissemelhanca(x(novos_representantes(2), :),M2(i,:));
    d3=calcula_dissemelhanca(x(novos_representantes(3), :),M2(i,:));
    d=[d1 d2 d3];
    [mn,id]=min(d);
    Q(i)=id(1);
end

%%%%%%%%%%%%%%%%Representar um caso em que o Algoritmo preveu mal %%%
% index da primeira classificaçao errada do modelo

misclassified_index = find(v ~= Q,1);
if ~isempty(misclassified_index)
misclassified_vector = M2(misclassified_index, :);

% Reshape da linha atual para formar uma matriz 5x5
        misclassified_vector=M2(52, :);
        imagemSimbolo=misclassified_vector(end:-1:1);
        matriz_5x5 = reshape(imagemSimbolo, 5, 5);
        % Exibir a matriz usando a função imagesc de maneira a que as
        % imagens fiquem viradas de pé
        imagesc(transpose(flipud(matriz_5x5)));
        v(misclassified_index)
        Q(misclassified_index)
    
end
keyboard;

%%%%%%%%%%%%%%%%% Função KNN MODELO %%%%%%%%%%%%%

function predictedLabels = knn_predict(trainData, labelsTreino, testData, k)
    testsize = size(testData, 1);
    numTrainSamples = size(trainData, 1);
    predictedLabels = zeros(testsize, 1);

    for i = 1:testsize
        % Initialize distances for each test sample
        distances = zeros(numTrainSamples, 1);

        for j = 1:numTrainSamples
            % Calcula dissemelhança (usando a métrica especifica) entre a data de treino e toda a data de teste
            distances(j) = sum(testData(i, :) ~= trainData(j, :));
        end

        % ordenar as distancias e retirar as k menores
        [~, indices] = sort(distances);
        kNearestIndices = indices(1:k);

        %extrair o nome/numero do cluster
        kNearestLabels = labelsTreino(kNearestIndices);
        % fazer previsão baseado na moda dos K mais proximos vizinhos
        predictedLabels(i) = mode(kNearestLabels);
    end
end

