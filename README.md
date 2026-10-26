# Trabalho de Compiladores

Implementação de uma calculadora avançada em C utilizando **Flex** para análise léxica e **Bison** para análise sintática. O projeto reconhece expressões aritméticas, comparações, variáveis, funções, estruturas de controle e definições de funções.

## Estrutura do projeto

- `src/` — código-fonte, especificações do Flex/Bison e cabeçalhos.
- `tests/` — entradas de teste para escopo, estruturas, expressões matemáticas e recursão.
- `docs/` — relatório e diagramas de sintaxe e transição.
- `Makefile` — regras para compilar e limpar os arquivos gerados.

## Requisitos

- GCC
- GNU Make
- Flex
- Bison

No Ubuntu/Debian, instale as dependências com:

```bash
sudo apt update
sudo apt install build-essential flex bison
```

## Compilação

Na raiz do projeto, execute:

```bash
make
```

## Execução

```bash
./bison-calc
```

Digite uma expressão por linha e pressione Enter. Para encerrar, use `Ctrl+D` no Linux/macOS.

Os arquivos em `tests/` podem ser usados como entradas para testar os recursos implementados. Por exemplo:

```bash
./bison-calc < tests/teste_matematico.txt
```

## Limpeza

Para remover o executável, objetos e arquivos gerados pelo Flex/Bison:

```bash
make clean
```
