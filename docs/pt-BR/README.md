# Setup

```ruby
require 'laranja'
Laranja.load('pt-BR')
```
## Available generators

### Nomes

```ruby
Laranja::Nome.nome                                  # Vitória Pereira
Laranja::Nome.nome(2)                               # Ígor Braga Santos => 2 sobrenomes
Laranja::Nome.primeiro_nome                         # Raul
Laranja::Name.sobrenome                             # Moreira
```

### Documentos

```ruby
Laranja::Documento.cpf                    # 23379020648
Laranja::Documento.cpf_formatado          # 524.966.867-49
Laranja::Documento.cpf(:rj)               # 29564858739 => CPF do Rio de Janeiro
Laranja::Documento.cpf_formatado(:BA)     # 101.182.995-90 => CPF da Bahia
Laranja::Documento.cpf('RS')              # 73272882014 => CPF do Rio Grande do Sul
Laranja::Documento.cpf('sp')              # 07537191859 => CPF de São Paulo
```

### Internet

```ruby
Laranja::Internet.email                             # elsionogueira@gmail.com
Laranja::Internet.email('Vitória Pereira')          # vitria.pereira@yahoo.com
Laranja::Internet.username                          # marli.macedo
Laranja::Internet.username('Ana Machado')           # anamachado
Laranja::Internet.username('Joel Melo', ['-'])      # joel-melo => Separador específico
Laranja::Internet.password                          # Pq9vD8VJzttr6vrB77hDCp2LVK8iSm1iUjezQuS9dlah0EUukfQDPLf5ad0e6WwsrI39
Laranja::Internet.password(2, 6)                    # COW => Senha com entre 2 a 6 caracteres (o padrão é entre 8 e 128)
```
NÃO USE ESTA BIBLIOTECA PARA GERAR SENHAS PARA USUÁRIOS DE VERDADE!

### Sexo

```ruby
Laranja::Sexo.sexo      # Feminino
Laranja::Sexo.sigla     # M
```

### Endereco

```ruby
Laranja::Endereco.cidade               # Santo Rafael do Sul
Laranja::Endereco.bairro               # Parque Condessa Carvalho
Laranja::Endereco.rua                  # Avenida Barão Norberto Martins Neto
Laranja::Endereco.complemento          # Lote 937
Laranja::Endereco.numero               # 608
Laranja::Endereco.cep_formatado        # 43519-000
Laranja::Endereco.cep                  # 49738343
Laranja::Endereco.cep('SP')            # 13663282
Laranja::Endereco.cep_formatado(:am)   # 64787-398
Laranja::Endereco.uf                   # Rondônia
Laranja::Endereco.uf_sigla             # MG
```
## Roadmap

- Documentos: CNPJ
- Empregos
- Telefonia
- Datas
- Banco (cartão de crédito, número de boleto, contas correntes...)
