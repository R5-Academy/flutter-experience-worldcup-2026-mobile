---
name: commit-aula
description: >-
  Faz o commit, a tag e o push da aula atual no repositório. Use when the user
  invokes /commit-aula, pede commit da aula, tag da aula, ou para gravar o
  progresso aula por aula.
disable-model-invocation: true
---

# Commit da aula

Workflow obrigatório para gravar uma aula. Siga os passos nesta ordem. Não pule etapas. Não invente o nome da aula.

## Passo 1 — Perguntar o nome da aula com o número

Se o usuário ainda não informou o número e o nome da aula, pergunte:

> Qual o número e o nome da aula? (ex.: 10.1 Guardando a sessão)

Não execute git até ter essa informação.

O valor informado no início é o `nomeAula`. Use esse mesmo valor em **todos** os pontos do fluxo (commit, tag e mensagem da tag). Não deixe o texto literal `nome da aula`.

A tag é o `nomeAula` em minúsculas, sem acentos, com espaços/pontos/hífens virando `_`.

Exemplo: se o usuário pediu `10.1 Guardando a sessão`:

- commit: `10.1 Guardando a sessão`
- tag: `10_1_guardando_a_sessao`
- mensagem da tag: `Aula 10.1 Guardando a sessão`

## Passo 2 — Staging

```bash
git add .
```

## Passo 3 — Commit

```bash
git commit -m '${nomeAula}'
```

Substitua `${nomeAula}` pelo nome solicitado no Passo 1.

Se não houver alterações, não crie commit vazio. Pare e avise.

## Passo 4 — Tag anotada

```bash
git tag -a ${tag} -m 'Aula ${nomeAula}'
```

Substitua `${tag}` pelo `nomeAula` em minúsculas com `_` e `${nomeAula}` pelo nome solicitado no Passo 1.

Não sobrescreva tag existente (`-f`). Se a tag já existir, pare e avise.

## Passo 5 — Push

```bash
git push origin main --tags
```

## Regras

- O `nomeAula` pedido no Passo 1 preenche **todos** os pontos: mensagem do commit, nome da tag (slug) e mensagem da tag.
- Rode os comandos de fato, nesta ordem. Não apenas descreva.
- Branch de destino: `main`.
- Não use `--no-verify`, `--amend` nem force push.
- Se o commit falhar, não crie a tag e não faça push.
- Ao terminar, informe o hash do commit, o nome da tag e que o push foi feito.
