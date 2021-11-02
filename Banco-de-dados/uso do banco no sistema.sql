-- cadastrar cliente completo (com login e senha):
call buscar_usuario('usuario_digitado') -- verifica se o usuario escolhido já existe
call buscar_cpf_cliente('33333333333') -- verifica se o cpf já está cadastrado
call cad_cliente('Joaquina', 'feminino', '33333333333', '1980-10-20', 'joaquina@gmail.com', '11989898989', 'arquiteta', null, 'Rua Dois', 200, null, 'Casa Verde', 'São Paulo', 'SP', '01234123', 'joaquina', '1234567')

(campos para cadastro de clientes:
nome, sexo, cpf_cli, data_nascimento, email, telefone, profissao, historico,
rua, numero, complemento, bairro, cidade, estado, cep, usuario, senha)


-- cadastrar cliente presencialmente (sem usuário e senha, é o funcionário que cadastra):
call buscar_cpf_cliente('33333333333') -- verifica se o cpf já está cadastrado
call cad_cliente_sem_senha('Maria', 'feminino', '44444444444', '1985-04-20', 'maria@gmail.com', '11787766566', 'professora', null, 'Rua Cinco', 500, null, 'Lapa', 'São Paulo', 'SP', '01234123')

(mesmos campos de cima, sem os dois últimos)


-- cadastrar usuario e senha de cliente já cadastrado:
call buscar_cpf_cliente('33333333333') -- verifica se o cpf já está cadastrado, se não estiver, redireciona para cadastro completo
call buscar_cliente_cpf_data_tel('33333333333', '1980-10-21', '11989898977') -- verifica se os dados informados (cpf, nascimento e telefone) estão corretos e retorna o cliente com id
call buscar_usuario('usuario_digitado') -- verifica se o usuario escolhido já existe
call cad_usuario_cliente(3, 'maria', '1234567') -- cadastra o login (id, usuario, senha)


-- consultar o cliente junto com o endereço:
select * from cliente_completo


-- atualizar cliente:
call atualizar_cliente(1, 'Joaquina', 'feminino', '1980-10-21', 'joaquina@gmail.com', '11989898977', 'arquiteta', null, 'Rua Dois', 300, null, 'Casa Verde', 'São Paulo', 'SP', '01234123')

(campos para atualizar:
id_cli, nome, sexo, data_nascimento, email, telefone, profissao, historico, rua, numero, complemento, bairro, cidade, estado, cep)


-- excluir cliente por ID:
call excluir_cliente(2);


-- cadastrar funcionário:
call buscar_usuario('usuario_digitado') -- verifica se o usuario escolhido já existe
call buscar_cpf_funcionario('11111111111') -- verifica se o cpf já está cadastrado
call cad_funcionario('Roberto', 'atendente', '11987654321', '22222222222', 'roberto@gmail.com', 'roberto', '1234567', '2')

(campos para cadastro de funcionario:
nome, cargo, telefone, cpf_func, email, usuario, senha, nivel (1 = administrador/gerente; 2 = funcionário normal) ) 


-- atualizar funcionario:
call atualizar_funcionario(1, 'Ana Rizzi', 'presidente', '11912345678', 'ana@gmail.com')

(campos: 
id_func, nome, cargo, telefone, email)

-- excluir funcionario por ID:
call excluir_funcionario(5);


-- atualizar senha:
call buscar_usuario_senha('ana', '1234567') -- ver se o usuario e a senha antiga estão corretos
call atualizar_senha('ana', '1234567', '12345')

(campos para atualizar a senha:
usuario, senha_antiga, senha_nova)


-- buscar usuario e senha para login:
call buscar_usuario_senha('ana', '1234567', 'funcionario')

(campos:
usuario, senha, tipo ('funcionario' ou 'cliente', o usuário deverá selecionar o tipo na página de login)
retorna o usuario, o id (cliente ou funcionário), o nome e o nivel de acesso )