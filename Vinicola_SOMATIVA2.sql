DROP DATABASE IF EXISTS vinicola;
CREATE DATABASE vinicola;
DROP USER IF EXISTS 'Somellier'@'localhost';

-- Criações ----------------------------------------------------------------------

CREATE TABLE vinicola.Regiao(
	codRegiao BIGINT AUTO_INCREMENT PRIMARY KEY,
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


-- Inserções ----------------------------------------------------------------------


INSERT INTO vinicola.Regiao(nomeRegiao, descricaoRegiao) VALUES
	('Vale das Pedras', 'Uma região de colinas suaves'),
	('Encosta dos Ventos', 'Marcada pela constante influência dos ventos marítimos'),
	('Serra do Ouro', 'Combinação de noites frias e dias ensolarados'),
	('Sol Nascente', 'Uma região de planaltos ensolarados e temperaturas moderadas'),
	('Vale dos Espelhos', 'O Vale dos Espelhos é uma região de clima equilibrado e forte');
    
INSERT INTO vinicola.Vinicola(nomeVinicola, descriçãoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES
	('Pedra Roxa', 'Produz vinhos frescos e elegantes', '4939821123', 'pr@gmail.com', '1'),
	('Encantos da Vida', 'Conhecida por seus vinhos aromáticos', '7432154478', 'ev@gmail.com', '2'),
    ('Sol de Ventos', 'Produz vinhos tintos intensos e vinhos brancos delicados', '4837642201', 'sv@gmail.com', '3'),
    ('Vinhos Finos', 'Cultiva uvas em solos argilosos', '5439017654', 'vf@gmail.com', '4'),
    ('Vinhos das Estrelas', 'Elabora vinhos com equilíbrio dos sabores', '5138479952', 've@gmail.com', '5');
    
INSERT INTO vinicola.Vinho(nomeVinho, tipoVinho, anoVinho, descriçãoVinho, codVinicola) VALUES
	('Aurora', 'Branco Seco', '2020', 'Um vinho branco jovem e fresco', '1'),
	('Daserra', 'Tinto', '2005', 'Produzido com uvas cultivadas em clima frio', '2'),
	('Encanto', 'Rose', '2022', 'Equilibrado e delicado', '3'),
    ('Brasa', 'Tinto', '1990', 'Ideal para brindar ocasiões especiais', '4'),
    ('Alvorecer', 'Suave', '2011', 'Intenso e complexo', '5');


-- Consultas ------------------------------------------------------------------


SELECT VNHO.nomeVinho, VNHO.anoVinho, VINI.nomeVinicola, R.nomeRegiao
FROM vinicola.Regiao AS R
JOIN vinicola.Vinicola as VINI ON R.codRegiao = VINI.codRegiao
JOIN vinicola.Vinho as VNHO ON VINI.codVinicola = VNHO.codVinicola;

-- Permissões ----------------------------------------------------------------------

CREATE USER 'Somellier'@'localhost' IDENTIFIED BY '123'
	WITH MAX_QUERIES_PER_HOUR 40;

GRANT SELECT ON vinicola.Vinho TO 'Somellier'@'localhost';
   
GRANT SELECT (codVinicola, nomeVinicola) ON vinicola.Vinicola TO 'Somellier'@'localhost';
