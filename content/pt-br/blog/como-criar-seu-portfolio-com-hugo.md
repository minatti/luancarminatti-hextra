---
title: 'Como Criar Seu Portfolio Com Hugo'
slug: "Como Criar Seu Portfólio Com Hugo"
date: 2025-08-03T19:25:10-03:00
draft: false
description: "Vamos criar um portfólio moderno, leve e escalável usando o framework Hugo com o tema hextra."
type: blog # Ou 'post', 'page', dependendo de como você organiza no Hextra
tags:
  - Hugo
  - StaticSiteGenerator
  - GitHubPages
  - DesenvolvimentoWeb
  - Portfólio
  - CarreiraDev
  - WebPerformance
  - Tutorial
categories:
  - Desenvolvimento Web # Escolha uma ou duas categorias principais
  - Carreira
  - Tutorial
hideDate: false
comments: true
---

> Um guia prático, direto ao ponto, com pitadas de experiência real e profundidade técnica explicada de forma suave e didática para você que quer criar sua própria presença digital.

---

## 🎯 O que vamos construir

Vamos criar um portfólio moderno, leve e escalável usando o **framework Hugo** — um gerador de site estático (SSG) focado em desempenho e SEO. Esse site irá apresentar quem você é, seus projetos, seu blog técnico e um canal de contato, sendo sua vitrine profissional e porta de entrada para futuras oportunidades.

---

## 1. O que é o framework Hugo?

Hugo é um **Static Site Generator (SSG)**, ou seja, um gerador de site estático. Diferente de sites dinâmicos que requerem banco de dados e renderização no servidor, os sites estáticos são renderizados antes de serem publicados. O resultado? Um site absurdamente rápido, seguro e pronto para escalar com facilidade.

### 1.1 Mas o que é um SSG?

Imagine que você escreve seus textos em arquivos Markdown e o Hugo transforma tudo isso em HTML puro, já otimizadinho para SEO, com estrutura perfeita. Não há banco de dados, nem código sendo executado a cada visita. Apenas arquivos estáticos prontos para serem servidos diretamente para o navegador.

---

## 2. Por que usar Hugo e não criar um site do zero?

Criar um site do zero exige tempo, conhecimento em HTML, CSS, JS, deploy, responsividade, SEO... E se você puder focar no conteúdo e deixar a estrutura com quem já fez isso por você? Hugo resolve isso.

Com ele você:

- Não precisa reinventar a roda.
- Ganha tempo com temas prontos e bonitos.
- Tem uma estrutura já pensada para performance e boas práticas.
- Facilita o deploy (principalmente com GitHub Pages).
- Garante um portfólio que carrega em milissegundos.

---

## 3. Requisitos para começar a brincadeira

Antes de colocar a mão na massa, vamos garantir que você tem as ferramentas certas no seu ambiente Linux (Debian ou derivados):

- **Git** (para controle de versão e deploy)
- **Hugo** (o motor do site)
- **Go** (linguagem base que o Hugo usa)

---

## 4. Como importar temas prontos

Não comece do zero. A comunidade Hugo oferece **centenas de temas prontos** que você pode usar como base. Isso acelera seu processo e evita perder tempo com detalhes visuais.

Para esse guia, vamos usar o tema [**Hextra**](https://github.com/imfing/hextra) — um tema simples, responsivo e ideal para quem quer um blog + portfólio sem dores de cabeça.

---

## 5. O que é deploy?

Deploy é o ato de publicar seu site na internet. É como tirar seu projeto da sua máquina local e colocá-lo no ar para o mundo ver.

---

## 6. O que é GitHub Pages?

GitHub Pages é um serviço gratuito oferecido pelo GitHub que hospeda seu site diretamente de um repositório Git. Ideal para sites estáticos como o que vamos criar.

- Gratuito
- Suporte a HTTPS
- Super rápido
- Integrado com Git

---

## 7. Como fazer deploy no GitHub Pages?

Basicamente:

- Você cria seu site localmente.
- Faz o build com o Hugo.
- Configura o `publishDir` para `docs/`.
- Envia tudo para seu repositório.
- Ativa o GitHub Pages na branch principal com a pasta `/docs`.

---

## 🛠️ Passo a passo

### 1. Instalando os requisitos no Linux

```bash
sudo apt update
sudo apt install git golang hugo
```

---

### 2. Verificando se tudo foi instalado corretamente

```bash
hugo version
git version
go version
```

Se tudo retornar com uma versão, você está pronto.

---

### 3. Criando o projeto Hugo

```bash
cd ~/Projetos/frontend/
hugo new site meu-site-hextra --format=yaml
cd meu-site-hextra
git init
git submodule add https://github.com/imfing/hextra.git themes/hextra
```

---

### 4. Configurando o projeto

Abra o arquivo `hugo.yaml` e edite:

```yaml
baseURL: "https://minatti.github.io/meu-blog-hextra/"
publishDir: "docs"
# canonifyurls: true  # (se precisar)
```

---

### 5. Criando um post de teste

```bash
hugo new content/posts/meu-primeiro-post.md
```

---

### 6. Limpando e gerando o site

```bash
rm -rf public/ docs/
hugo --gc --cleanDestinationDir
```

---

### 7. Fazendo o deploy no GitHub Pages

- Crie um repositório no GitHub com o mesmo nome que está usando.
- Adicione o repositório remoto, faça commit e push:

```bash
git remote add origin git@github.com:minatti/meu-blog-hextra.git
git add .
git commit -m "First commit"
git push -u origin main
```

- No GitHub, em **Settings > Pages**, aponte para a branch `main` e pasta `/docs`.

Pronto! Seu site está no ar.

---

## ✅ Resultado final

Você saiu do zero absoluto e agora tem um portfólio profissional, com estrutura pensada para SEO, performance e extensão futura. Entendeu como funciona um site estático, explorou o ecossistema do Hugo, configurou e publicou no GitHub Pages. Além disso, construiu base para evoluir com blog, serviços e muito mais.


## 🔗 Referências

- [Docs oficial do Hugo – Content Management](https://gohugo.io/content-management/)
- [Guia de Markdown – Markdown Guide (Basic Syntax)](https://www.markdownguide.org/basic-syntax/)
- [Temas Hugo – Galeria oficial de temas](https://themes.gohugo.io/)

