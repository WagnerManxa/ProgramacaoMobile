# Entrega 3

A new Flutter project.

## Getting Started

# ProgramacaoMobile
#Desenvolvido por Wagner Silva e Erick Paiva

### Utilização ###

# Ao acessar a homepage, precione o ícone de calendário (no canto superior direito) para informar a quantidade de dias úteis do mês de trabalho e informar os dias já trabalhados.

# Precione o indicador na tela inicial que deseja saber mais;

# Precione o ícone de prancheta (no canto inforior direito) para informar o quanto foi produzido;


### Peculiaridades ###

# O aplicativo contará com um tela de login uma vez que implementado banco de dados, atualmente o usuário está se baseando no repositório estatico com uma lista de vendedores;

# Atualmente conta-se com 7 indicadores que juntos formaram a excelencia em vendas. Cada indicador terá uma pontuação de acordo com o percentual atingido da meta. Posteriormente mais indicadores serão implementados;

# Será implementado um sistema de pontuação e a mesma será mostrada em um CircleProgressBar dentro do Container_Modificado;

# A pontuação do vendedor será informada ao usuário e servirá de base para premiação com a seguinte regra:
1000 pontos = A1000;
800 á 999 = A prêmio = 40%;
600 á 799 = B prêmio = 25%;
400 á 599 = C prêmio = 15%; 
200 á 399 = D sem prêmio;
>200 = E sem prêmio;

# As informações lançadas estão sendo mantidas em uma classe ChageNotifier para posterior integração com banco de dados;

# Está sendo salvo as informações de relizado no appstate e posteriormente enviado ao banco de dados. 

# BUG! Os indicadores estão sendo os mesmo para qualquer usuário que faça o login. 

# Os indicadores estão sendo salvos no banco de dados porém a leitura dos mesmo não foi implementada.

### Instalação ###

#Passo 1: Baixar o arquivo do GitHub
#Passo 2: Descompactar o arquivo baixado
#Passo 3: Abra o VSCode
#Passo 4: No VSCode abra o arquivo descompactado e entre no arquivo my_app
#Passo 5: No arquivo my_app clieque em teste2 e clique em selecionar pasta
#Passo 6: Pronto o arquivo estara aberto no VSCode, em seguida alguns erros que podem ocorrer

### Erros que podem ocorrer na instalação do arquivo ###

# * Erro nos imports: ao baixar o código do Git, esse erro pode ocorrer devido ao caminho que o import seguia originalmente, bastando apenas corrigi-lo.

# * Outro erro no import. Esse erro ocorreu quando eu baixei o arquivo que havia enviado no Git para testá-lo.
# Para corrigi-lo, bastou apenas dar "Add 'intl' to dependencies".

# * Erro no pubspec.yaml, precisamente no SDK. Esse erro ocorreu devido ao meu SDK ser de algumas versões anteriores à que o Wagner está utilizando.
# Para arrumá-lo, atualize o SDK ou modifique para a versão anterior. No pubspec.yaml também houve erro na versão do provider, bastando alterá-la.

# * Erro na pasta 'android' do projeto: "Unsupported Gradle project". Para arrumá-lo, foi apenas necessário dar um novo "flutter create -t app" e arrastar a pasta assets,
# lib e pubspec.yaml para a nova pasta criada, corrigir os imports, e o projeto voltou a funcionar de maneira adequada.

#----------------------------------------------------------------------------------------------------------------------------
# instale o Firebase
# use flutterfire cofigure e flutter pub add firebase_core
# Ao baixar o arquivo que foi upado para o git, há um bug no addvendedorpage ao clicar no botão o aplicativo trava, não faço ideia pq isso ocorra, visto q no arquivo original
# ele não trava e exibe os vendedores a serem adicionados, importante relatar isso na hora da apresentação.

#-------------------------------------------------------------------------------------------------------------------------------
# Uso de Recursos Nativos no aplicativo consiste em usar a galeria de fotos para trocar o icone do usuário
# ao trocar a foto é necessário deslogar e logar novamente, e as vezes pode ocorrer bugs
# O Uso de uma API Web, consiste em uma API que fornece as datas de feriados durante o ano, na aplicação limitei ela, para exibir apenas os feriados no mês
# Os feriados são exibidos no lançar dias
# Link da API utilizada: https://date.nager.at/Api
