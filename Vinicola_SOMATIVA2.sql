CREATE TABLE vinicola.Regiao(
codRegiao VARCHAR(100) AUTO_INCREMENT PRIMARY KEY,
nomeRegiao VARCHAR(100) NOT NULL,
descricaoRegiao TEXT
);

CREATE TABLE vinicola.Vinicola(
	codVinicola BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeVinicola VARCHAR(100) NOT NULL,
    descriçãoVinicola TEXT,
    foneVinicola VARCHAR(15),
    emailVinicola VARCHAR(15),
    codRegiao BIGINT,
    FOREIGN KEY (CodRegiao) REFERENCES vinicola.Regiao(codRegiao)
);

CREATE TABLE vinicola.Vinho(
	codVinho BIGINT AUTO_INCREMENT PRIMARY KEY,
	nomeVinho VARCHAR(50) NOT NULL,
	tipoVinho VARCHAR(30) NOT NULL,
	anoVinho INT NOT NULL,
	descriçãoVinho TEXT,
	codVinicola BIGINT,
    FOREIGN KEY (codVinicola) REFERENCES vinicola.Vinicola(codVinicola)
);

INSERT INTO vinicola.Regiao(nomeRegiao, descricaoRegiao) VALUES
	('Vale das Pedras', 'Uma região de colinas suaves'),
	('Encosta dos Ventos', 'Marcada pela constante influência dos ventos marítimos'),
	('Serra do Ouro', 'Combinação de noites frias e dias ensolarados'),
	('Sol Nascente', 'Uma região de planaltos ensolarados e temperaturas moderadas'),
	('Vale dos Espelhos', 'O Vale dos Espelhos é uma região de clima equilibrado e forte');
    
INSERT INTO vinicola.Vinicola(nomeVinicola, descriçãoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES
	('Pedra Roxa', 'Produz vinhos frescos e elegantes', '4939821123', 'pedraroxa@gmail.com', '1'),
	('Encantos da Vida', 'Conhecida por seus vinhos aromáticos', '743215-4478', 'encantosdavida@gmail.com', '2'),
    ('Sol de Ventos', 'Produz vinhos tintos intensos e vinhos brancos delicados', '4837642201', 'soldeventos@gmail.com', '3'),
    ('Vinhos Finos', 'Cultiva uvas em solos argilosos', '5439017654', 'vinhosfinos@gmail.com', '4'),
    ('Vinhos das Estrelas', 'Elabora vinhos com equilíbrio dos sabores', '5138479952', 'vinhosdasestrelas@gmail.com', '5');
    
INSERT INTO vinicola.Vinho(nomeVinho, tipoVinho, anoVinho, descriçãoVinho, codVinicola) VALUES
	('Aurora', 'Branco Seco', '2020', 'Um vinho branco jovem e fresco', '1'),
	('Daserra', 'Tinto', '2005', 'Produzido com uvas cultivadas em clima frio', '2'),
	('Encanto', 'Rose', '2022', 'Equilibrado e delicado', '3'),
    ('Brasa', 'Tinto', '1990', 'Ideal para brindar ocasiões especiais', '4'),
    ('Alvorecer', 'Suave', '2011', 'Intenso e complexo', '5');
    
