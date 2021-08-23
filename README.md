# Tour Of Heroes

CRUD de Heros feito em Ruby on Rails no padrão MVC.

Esse repositório faz parte do [Curso de Ruby on Rails 6 como API](https://www.youtube.com/watch?v=gTR6lx00Nac&list=PLqsayW8DhUmuvgOX08aXYk6Y-HGrdYg20).

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      3.0.1
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.4.1
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite3
    </td>
  </tr>
</table>

## Configurações iniciais para rodar o projeto

```bash
# clonar o projeto
git clone https://github.com/eltonsantos/tour-of-heroes.git
cd tour-of-heroes

# instalar as dependências do Ruby on Rails
bundle install

# instalar as dependências do Node.js
yarn install

# criar os bancos de dados de development e test
rails db:create

# criar as tabelas
rails db:migrate
```

## Credenciais do projeto

### Caso você seja o dono ou faça parte do time:

Crie um arquivo `config/master.key` e coloque dentro dele a chave para descriptar o arquivo `config/credentials.yml.enc`.

```bash
# para criar o arquivo
touch config/master.key
```

### Se não se enquadra no caso anterior:

```bash
# apague o arquivo config/credentials.yml.enc
rm config/credentials.yml.enc

# rode o comando para criar o credentials e master key (substitua 'code' caso não use o VS Code)
EDITOR="code --wait" bin/rails credentials:edit
```

Agora adicione a informação abaixo para autenticar quando for manipular o CRUD (substitua `your_name` e `your_password` pelos valores que desejar):

```yml
authenticate:
  name: your_name
  password: your_password
```

Salve e feche o arquivo `config/credentials.yml.enc`.

## Rodar o projeto

```
rails s
```

Abra o browser no endereço `http://localhost:3000`

Para navegar no projeto em produção acesse [https://tour-of-heroes-eltonsantos.herokuapp.com](https://tour-of-heroes-eltonsantos.herokuapp.com/)