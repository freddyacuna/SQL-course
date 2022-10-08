
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1.BD_SALUD`
--

-- --------------------------------------------------------

--
-- Table structure for table `CENTRO_DE_SALUD`
--

CREATE TABLE `CENTRO_DE_SALUD` (
  `ID_CS` varchar(20) NOT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Prevision` text,
  `Nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CENTRO_DE_SALUD`
--

INSERT INTO `CENTRO_DE_SALUD` (`ID_CS`, `Direccion`, `Prevision`, `Nombre`) VALUES
('CA-19', 'Calle Matta 1945', 'Isapre', 'Clínica Antofagasta'),
('CA-56', 'Avenida Vitacura 5951', 'Isapre', 'Clínica Alemana'),
('CALD-10', 'Avenida José Alcalde Délano 12', 'Isapre', 'Clínica Alemana de La Dehesa'),
('CAO-17', 'Avenida Zenteno 1530', 'Isapre', 'Clínica Alemana de Osorno'),
('CASA-81', 'Avenida Copayapu 877', 'Isapre', 'Clínica Atacama S.A.'),
('CAT-61', 'Calle Senador Estebanez 645', 'Isapre', 'Clínica Alemana de Temuco'),
('CAV-71', 'Calle Beauchef 765', 'Isapre', 'Clínica Alemana Valdivia'),
('CB-15', 'Calle Paihuano 1119', 'Fonasa', 'Consultorio Bautista'),
('CC-15', 'Calle Antonio Bellet 189', 'Isapre', 'Clínica Costanera'),
('CC-33', 'Avenida Pedro Aguirre Cerda 35', 'Isapre', 'Clínica Chillán'),
('CCMA-64', 'Calle 13 Norte 635', 'Isapre', 'Clínica Ciudad del Mar (ex Ava'),
('CCSB-28', 'Calle OHiggins 237', 'Fonasa', 'Centro Clínico San Bernardo'),
('CCSFA-81', 'Calle Arcalafquen 855', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFB-44', 'Calle Bueras 456', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFDCS-58', 'Calle Villa Doña Carmen Los Pe', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFE-56', 'Calle San Miguel 590', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFEA-28', 'Calle Luis Millares 2104', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFEP-57', 'Avenida El Peral, Lote 1-A, El', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFL-40', 'Pasaje Ernestina Aguirre 4270', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFLLUVN-11', 'Calle Lanalhue 1780', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFM-28', 'Pasaje Camarico, Sector Murrin', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFM-81', 'Calle Tricolor, Población Mill', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CCSFO-39', 'Avenida Vasco de Gama, Poblaci', 'Fonasa', 'Centro Comunitario de Salud Fa'),
('CD-40', 'Avenida Recoleta 464', 'Isapre', 'Clínica Dávila'),
('CDV-43', 'Calle Maratón 425', 'Isapre', 'Clínica Dial Vida'),
('CF-14', 'Avenida Diego Portales 1569', 'Isapre', 'Clínica Familia'),
('CI-11', 'Calle Bernardo OHiggins 103', 'Isapre', 'Clínica Iquique'),
('CI-14', 'Avenida Santa María 1810', 'Isapre', 'Clínica Indisa'),
('CIMM-33', 'Avenida Manquehue 329', 'Fonasa', 'Centro Integra Médica Manquehu'),
('CIR-19', 'Calle Carretera del Cobre 1330', 'Fonasa', 'Centro Intersalud Rancagua'),
('CISM-38', 'Calle El Llano Subercaseaux 39', 'Fonasa-Isapre', 'Centro Integramédica San Migue'),
('CIT-33', 'Calle Mall Plaza del Trébol 31', 'Fonasa-Isapre', 'Centro Integramédica del Trébo'),
('CIT-38', 'Avenida Camilo Henríquez 3296', 'Fonasa-Isapre', 'Centro Integramédica Tobalaba'),
('CLA-56', 'Calle Dr. Genaro Reyes 581', 'Isapre', 'Clínica Los Andes'),
('CLC-42', 'Calle Lo Fontecilla 441', 'Isapre', 'Clínica Las Condes'),
('CLC-52', 'Avenida Santa María 5950', 'Isapre', 'Clínica Lo Curro'),
('CLL-21', 'Avenida Eliodoro Yáñez 2087', 'Isapre', 'Clínica Las Lilas'),
('CLL-58', 'Avenida Latorre 54', 'Isapre', 'Clínica Los Leones'),
('CLV-36', 'Calle Argomedo 344', 'Isapre', 'Clínica Las Violetas'),
('CM-14', 'Avenida Presidente Freire 1313', 'Isapre', 'Clínica Mella'),
('CM-24', 'Calle Los Fresnos 276', 'Isapre', 'Clínica Miraflores'),
('CMCENTROMED-35', 'Calle 4 Poniente 332', 'Fonasa', 'Centro Médico CENTROMED'),
('CMCHP-66', 'Calle Tristán Valdés 66', 'Fonasa', 'Centro Médico Clínica Hospital'),
('CMCSMLD-19', 'Avenida La Dehesa 1445', 'Fonasa', 'Centro Médico Clínica Santa Ma'),
('CMILS-10', 'Calle Alberto Solari 1400', 'Fonasa-Isapre', 'Centro Médico Integramédica La'),
('CMK-31', 'Calle Barros Arana 301', 'Fonasa', 'Centro Médico Kenal'),
('CMN-84', 'Avenida Pedro Aguirre Cerda 83', 'Fonasa', 'Centro Médico Norte'),
('CMOCS-45', 'Avenida Libertador Bernardo OH', 'Fonasa', 'Centro Médico O Carrol Salud'),
('CMOS-79', 'Calle Colón 781', 'Fonasa', 'Centro Médico Osorno Salud'),
('CMS-16', 'Avenida Francia 1655', 'Fonasa', 'Centro Médico Surmedica'),
('CMSJCEDIUC-42', 'Avenida Vicuña 4686', 'Fonasa', 'Centro Médico San Joaquín (CED'),
('CMVIA-18', 'Calle Alameda 1620', 'Fonasa', 'Centro Médico Vida Integra Ala'),
('CMVIT-16', 'Calle Tobalaba 155', 'Fonasa', 'Centro Médico Vida Integra Tob'),
('CPM-49', 'Calle Panamericana 400', 'Isapre', 'Clínica Puerto Montt'),
('CPM-72', 'Calle Lord Cochrane 779', 'Isapre', 'Clínica Pedro Montt'),
('CPS-66', 'Calle Gran Avenida 6868', 'Fonasa', 'Consultorio Prefectura Sur'),
('CRC-35', 'Calle Carmen 321', 'Isapre', 'Clínica Regional de Curicó'),
('CRE-18', 'Avenida El Santo 1475', 'Isapre', 'Clínica Regional Elqui'),
('CSA-42', 'Calle General Freire 46', 'Isapre', 'Clínica Santa Amalia'),
('CSAC-27', 'Calle Cobija 2188', 'Fonasa', 'Centro de Salud Aidoret Caro'),
('CSCA-11', 'Calle Camino El Alba 12351', 'Isapre', 'Clínica San Carlos de Apoquind'),
('CSFAREC-62', 'Avenida Rendic 6071', 'Fonasa', 'Centro de Salud Familiar Anton'),
('CSFC-43', 'Calle Plaza de Curimón 45', 'Fonasa', 'Centro de Salud Familiar Curim'),
('CSFCN-70', 'Calle Sado 7965', 'Fonasa', 'Centro de Salud Familiar Cerro'),
('CSFDAS-11', 'Calle Huelén 1629', 'Fonasa', 'Centro de Salud Familiar Dr. A'),
('CSFDMS-13', 'Pasaje Mar Báltico 13256', 'Fonasa', 'Centro de Salud Familiar Dr. M'),
('CSFEQ-21', 'Calle Isidoro Dubornais 250', 'Fonasa', 'Centro de Salud Familiar El Qu'),
('CSFP-19', 'Calle Costa Rica 1000', 'Fonasa', 'Centro de Salud Familiar Peñaf'),
('CSFPMB-70', 'Calle Nueva San Martín 776', 'Fonasa', 'Centro de Salud Familiar Presi'),
('CSFPN-23', 'Calle Nahuelbuta 2815', 'Fonasa', 'Centro de Salud Familiar Puebl'),
('CSFSS-15', 'Calle Pedro Meriño 1948', 'Fonasa', 'Centro de Salud Familiar Santa'),
('CSM-42', 'Avenida Santa María 410', 'Isapre', 'Clínica Santa María'),
('CSM-87', 'Calle José Manuel Balmaceda 85', 'Fonasa', 'Centro de Salud Masisa'),
('CSM-91', 'Calle Álvarez de Toledo 943', 'Isapre', 'Clínica San Miguel'),
('CSR-49', 'Calle Copacabana 493', 'Isapre', 'Clínica Santa Rosa'),
('CSVIB-10', 'Calle Bandera 101', 'Fonasa', 'Centro de Salud Vida Integra B'),
('CSVL-80', 'Calle Monjitas 843', 'Fonasa', 'Centro de Salud Vival Ltda.'),
('CT-13', 'Avenida Tabancura 1185', 'Isapre', 'Clínica Tabancura'),
('CT-81', 'Calle General Tavarías 83', 'Fonasa', 'Consultorio Tantauco'),
('CV-18', 'Calle Serafín Zamora 190', 'Isapre', 'Clínica Vespucio'),
('CVILC-34', 'Avenida Apoquindo 3281', 'Fonasa', 'Centro Vida Integra de Las Con'),
('CVILF-17', 'Avenida Walker 1396', 'Fonasa', 'Centro Vida Integra de La Flor'),
('CVIM-20', 'Avenida Pajaritos 2833', 'Fonasa', 'Centro Vida Integra de Maipú'),
('CVIPA-67', 'Calle Ernesto 63', 'Fonasa', 'Centro Vida Integra de Puente '),
('CVIQ-37', 'Avenida Bernardo OHiggins 334', 'Fonasa', 'Centro Vida Integra Quilicura'),
('CVISM-61', 'Calle José Miguel Carrera 6251', 'Fonasa', 'Centro Vida Integra de San Mig'),
('HBSJO-15', 'Calle Guillermo Buhler 1765', 'Fonasa', 'Hospital Base San José de Osor'),
('HC-46', 'Calle Eulogio Goycolea 450', 'Fonasa', 'Hospital de Calbuco'),
('HCMECDLVF-16', 'Calle Rinconada 1001', 'Fonasa', 'Hospital Clínico Metropolitano'),
('HCMLFDEDI-62', 'Calle Froilan Roa 6542', 'Fonasa', 'Hospital Clínico Metropolitano'),
('HCRV-11', 'Calle Bueras 1003', 'Fonasa', 'Hospital Clínico Regional (Val'),
('HCSB-12', 'Calle Santa Rosa 1234', 'Fonasa', 'Hospital Clínico San Borja'),
('HCSSA-37', 'Calle Cardenio Avello 36', 'Fonasa', 'Hospital Clínico del Sur S.A.'),
('HCVM-16', 'Calle Limache 1741', 'Fonasa', 'Hospital Clínico Viña del Mar'),
('HDETGI-53', 'Calle Héroes de la Concepción ', 'Fonasa', 'Hospital Dr. Ernesto Torres Ga'),
('HDFBCSQN-26', 'Calle Leoncio Fernández 2655', 'Fonasa', 'Hospital Dr. Félix Bulnes Cerd'),
('HDHHAT-16', 'Calle Montt 115', 'Fonasa', 'Hospital Dr. Hernán Henríquez '),
('HDSSP-31', 'Avenida Salvador 364', 'Fonasa', 'Hospital Del Salvador (Santiag'),
('HDTHM-10', 'Calle Vital Apoquindo 1200', 'Fonasa', 'Hospital Dipreca Teniente Hern'),
('HEPSSB-17', 'Avenida Padre Hurtado 13560', 'Fonasa', 'Hospital El Pino (Santiago, Sa'),
('HIA-19', 'Calle Quellon 11', 'Fonasa', 'Hospital de día Infanto Adoles'),
('HLHT-72', 'Calle Alto Horno 777', 'Fonasa', 'Hospital Las Higueras (Talcahu'),
('HP-25', 'Calle Carrera 214', 'Fonasa', 'Hospital de Peñaflor'),
('HRR-60', 'Calle Alameda 611', 'Fonasa', 'Hospital Regional de Rancagua'),
('HSJDLS-99', 'Calle Balmaceda 916', 'Fonasa', 'Hospital San Juan de Dios (La '),
('IB-17', 'Calle Bandera 162', 'Fonasa-Isapre', 'Integramédica Bandera'),
('IFV-76', 'Avenida Vicuña Mackenna 7110', 'Fonasa-Isapre', 'Integramédica Florida Vespucio'),
('ILC-41', 'Calle Nevería 4715', 'Fonasa-Isapre', 'Integramédica Las Condes'),
('IMA-12', 'Calle Camino El Alto 17040', 'Fonasa', 'Instituto Médico el Arrayán'),
('IMI-16', 'Avenida Libertad of. 601, Edif', 'Fonasa', 'Instituto Medico Infantil'),
('IMPS-29', 'Avenida Jorge Alessandri 20040', 'Fonasa-Isapre', 'Integramédica Mall Plaza Sur'),
('IPA-28', 'Avenida Concha 26', 'Fonasa-Isapre', 'Integramédica Puente Alto'),
('IR-42', 'Calle Tte. Coronel José Bernar', 'Fonasa-Isapre', 'Integramédica Rancagua'),
('IVM-86', 'Calle 13 Norte, Piso 4 - 5 853', 'Fonasa-Isapre', 'Integramédica Viña del Mar'),
('NCC-72', 'Avenida Alexander Fleming 7885', 'Fonasa', 'Nueva Clínica Cordillera'),
('PI-13', 'Avenida España 1000', 'Fonasa', 'Policlínico Infodema'),
('PNPM-26', 'Avenida Diego Portales 2300', 'Fonasa', 'Policlínico Naval de Puerto Mo'),
('PSMP-16', 'Calle Andrés Bello, Población ', 'Fonasa', 'Policlínico San Martín de Porr');

-- --------------------------------------------------------

--
-- Table structure for table `CONTAGIA`
--

CREATE TABLE `CONTAGIA` (
  `Nombre_E` varchar(20) NOT NULL,
  `Rut_P` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CONTAGIA`
--

INSERT INTO `CONTAGIA` (`Nombre_E`, `Rut_P`) VALUES
('Virus papiloma human', '10052126-1'),
('Virus papiloma human', '10251087-9'),
('VIH', '10262238-3'),
('Sarampión', '10907183-8'),
('Poliomielitis', '10987637-2'),
('Tuberculosis', '11330175-9'),
('Tuberculosis', '11660445-0'),
('VIH', '11756388-K'),
('VIH', '12242853-2'),
('Poliomielitis', '12254594-6'),
('COVID-19', '12426179-1'),
('Tuberculosis', '12582458-7'),
('COVID-19', '12732725-4'),
('VIH', '12798713-0'),
('VIH', '13897465-0'),
('Hepatitis B', '13910986-4'),
('Poliomielitis', '14097237-1'),
('Hepatitis B', '14493757-0'),
('VIH', '15668430-9'),
('Tétanos', '15926482-3'),
('Sarampión', '15944732-4'),
('Virus papiloma human', '16968985-7'),
('Influenza', '17598833-5'),
('Tuberculosis', '18227955-2'),
('Tuberculosis', '18328729-k'),
('Sarampión', '19091042-3'),
('Influenza', '19324587-0'),
('Sarampión', '19417683-K'),
('Influenza', '19936126-0'),
('VIH', '20293607-5'),
('Virus papiloma human', '20338726-1'),
('Virus papiloma human', '20599397-5'),
('Poliomielitis', '20869275-5'),
('Tétanos', '21216938-2'),
('Poliomielitis', '21530906-1'),
('Hepatitis B', '21627706-6'),
('COVID-19', '21902423-1'),
('COVID-19', '22131415-8'),
('Influenza', '22569634-9'),
('Tétanos', '23200250-6'),
('COVID-19', '23413945-2'),
('Tétanos', '23417084-8'),
('VIH', '24106579-0'),
('Poliomielitis', '24153354-9'),
('Hepatitis B', '24564009-9'),
('COVID-19', '24763335-9'),
('Tuberculosis', '24867555-1'),
('Virus papiloma human', '25060792-K'),
('VIH', '25207322-1'),
('Virus papiloma human', '25501606-7'),
('Hepatitis B', '25805069-K'),
('Tuberculosis', '26346325-0'),
('Influenza', '26518668-8'),
('COVID-19', '26601705-7'),
('VIH', '27015464-6'),
('Tétanos', '27054564-5'),
('Sarampión', '27230281-2'),
('Tuberculosis', '27623695-4'),
('Tuberculosis', '27808819-7'),
('COVID-19', '27857575-6'),
('Tétanos', '28723270-5'),
('Hepatitis B', '28933390-8'),
('COVID-19', '29493406-5'),
('Sarampión', '6992106-k'),
('Influenza', '7719667-6'),
('Tétanos', '8091091-6'),
('Tétanos', '8472487-4'),
('Poliomielitis', '8616345-4'),
('VIH', '8663749-9'),
('Tuberculosis', '8824295-5'),
('Sarampión', '8955283-4'),
('Poliomielitis', '9021477-2'),
('Poliomielitis', '9051543-8'),
('Sarampión', '9274767-0'),
('Tuberculosis', '9715876-2');

-- --------------------------------------------------------

--
-- Table structure for table `DIAGNOSTICO_MEDICO`
--

CREATE TABLE `DIAGNOSTICO_MEDICO` (
  `ID_D` varchar(20) NOT NULL,
  `Diagnostico` text,
  `Instituto` text,
  `RUT_PM` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DIAGNOSTICO_MEDICO`
--

INSERT INTO `DIAGNOSTICO_MEDICO` (`ID_D`, `Diagnostico`, `Instituto`, `RUT_PM`) VALUES
('AE-621', 'Resfriado común', 'Clinica', '13393402-2'),
('AQ-248', 'Sarampión', 'Hospital', '26314431-7'),
('BB-975', 'Resfriado común', 'Clinica', '23936414-4'),
('BU-274', 'Resfriado común', 'Cesfam', '25653519-K'),
('CA-674', 'Influenza', 'Centro médico', '14561959-9'),
('CQ-493', 'Influenza', 'Centro médico', '14561959-9'),
('EH-500', 'Resfriado común', 'Cesfam', '19341368-4'),
('EI-339', 'Resfriado común', 'Centro médico', '14561959-9'),
('FY-898', 'Resfriado común', 'Cesfam', '22651730-8'),
('GC-468', 'Influenza', 'Clinica', '22453577-5'),
('GD-758', 'Tuberculosis', 'Clinica', '25653519-K'),
('GM-264', 'Resfriado común', 'Centro médico', '14561959-9'),
('GX-658', 'Resfriado común', 'Hospital', '27860788-7'),
('GZ-148', 'Tuberculosis', 'Cesfam', '24736254-1'),
('HB-522', 'Resfriado común', 'Hospital', '13393402-2'),
('HG-234', 'Tétanos', 'Cesfam', '21775840-8'),
('HK-536', 'Resfriado común', 'Centro médico', '20996010-9'),
('HW-597', 'Resfriado común', 'Centro médico', '24736254-1'),
('IP-721', 'Resfriado común', 'Hospital', '14028057-7'),
('JI-319', 'Resfriado común', 'Clinica', '19341368-4'),
('JL-231', 'Resfriado común', 'Cesfam', '25701741-9'),
('JL-546', 'Resfriado común', 'Hospital', '11944737-2'),
('JV-466', 'Resfriado común', 'Clinica', '25653519-K'),
('KC-479', 'Tuberculosis', 'Clinica', '22651730-8'),
('KC-949', 'Resfriado común', 'Clinica', '20996010-9'),
('KW-455', 'Resfriado común', 'Cesfam', '26128891-5'),
('KZ-915', 'Tuberculosis', 'Cesfam', '20996010-9'),
('LD-236', 'Resfriado común', 'Centro médico', '23936414-4'),
('LO-857', 'Influenza', 'Clinica', '26128891-5'),
('LZ-351', 'Influenza', 'Centro médico', '13393402-2'),
('MI-573', 'Resfriado común', 'Hospital', '14561959-9'),
('ML-322', 'Resfriado común', 'Hospital', '14028057-7'),
('MP-939', 'Tuberculosis', 'Hospital', '13576291-1'),
('MT-467', 'Resfriado común', 'Clinica', '20996010-9'),
('MV-224', 'Resfriado común', 'Centro médico', '26588880-1'),
('MX-899', 'Resfriado común', 'Clinica', '27860788-7'),
('MX-909', 'Resfriado común', 'Cesfam', '19341368-4'),
('NA-000', NULL, NULL, NULL),
('NV-326', 'Resfriado común', 'Clinica', '26128891-5'),
('PA-787', 'Resfriado común', 'Clinica', '13576291-1'),
('PD-946', 'Resfriado común', 'Hospital', '13576291-1'),
('PS-272', 'Resfriado común', 'Centro médico', '11944737-2'),
('QE-451', 'Resfriado común', 'Hospital', '11944737-2'),
('QH-617', 'Tétanos', 'Hospital', '23936414-4'),
('QI-407', 'Tuberculosis', 'Centro médico', '13576291-1'),
('QO-868', 'Resfriado común', 'Centro médico', '25653519-K'),
('QQ-115', 'Resfriado común', 'Cesfam', '27860788-7'),
('RR-631', 'Sarampión', 'Hospital', '21839164-8'),
('SB-550', 'Sarampión', 'Centro médico', '9596548-2'),
('SL-450', 'Tétanos', 'Cesfam', '26314431-7'),
('SO-499', 'Resfriado común', 'Hospital', '13393402-2'),
('TK-413', 'Resfriado común', 'Hospital', '20996010-9'),
('TL-762', 'Tuberculosis', 'Hospital', '21839164-8'),
('UA-516', 'Resfriado común', 'Centro médico', '26128891-5'),
('UA-587', 'Tuberculosis', 'Clinica', '25653519-K'),
('UL-923', 'Tuberculosis', 'Centro médico', '25653519-K'),
('UQ-971', 'Tétanos', 'Clinica', '25701741-9'),
('UY-288', 'Sarampión', 'Centro médico', '14028057-7'),
('VG-180', 'Sarampión', 'Clinica', '25653519-K'),
('VP-837', 'Influenza', 'Clinica', '21852320-K'),
('VV-911', 'Resfriado común', 'Clinica', '21839164-8'),
('WK-197', 'Sarampión', 'Hospital', '20996010-9'),
('WS-503', 'Tétanos', 'Clinica', '13393402-2'),
('XV-269', 'Tétanos', 'Centro médico', '26989227-7'),
('XY-399', 'Resfriado común', 'Clinica', '13393402-2'),
('YB-880', 'Resfriado común', 'Cesfam', '13393402-2'),
('YC-952', 'Tuberculosis', 'Cesfam', '13393402-2'),
('YT-655', 'Resfriado común', 'Hospital', '26128891-5'),
('YX-589', 'Tétanos', 'Centro médico', '26989227-7'),
('ZC-593', 'Sarampión', 'Hospital', '26128891-5'),
('ZF-354', 'Tuberculosis', 'Clinica', '27860788-7'),
('ZG-958', 'Resfriado común', 'Hospital', '21839164-8'),
('ZK-723', 'Resfriado común', 'Cesfam', '26989227-7'),
('ZR-829', 'Tétanos', 'Cesfam', '26128891-5'),
('ZV-331', 'Resfriado común', 'Cesfam', '21839164-8'),
('ZW-500', 'Sarampión', 'Hospital', '26128891-5');

-- --------------------------------------------------------

--
-- Table structure for table `ENFERMEDAD`
--

CREATE TABLE `ENFERMEDAD` (
  `Nombre_E` varchar(20) NOT NULL,
  `Sintomatologia` text,
  `Via_transmision` text,
  `Casos_activos` int(20) DEFAULT NULL,
  `Casos_confirmados` int(20) DEFAULT NULL,
  `Cantidad_recuperados` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ENFERMEDAD`
--

INSERT INTO `ENFERMEDAD` (`Nombre_E`, `Sintomatologia`, `Via_transmision`, `Casos_activos`, `Casos_confirmados`, `Cantidad_recuperados`) VALUES
('COVID-19', 'Fiebre, tos, cansancio, pérdida del gusto o del olfato', 'A través del contacto directo o de gotículas respiratorias', 12231, 4634889, 4551457),
('Hepatitis B', 'Dolor abdominal, orina oscura, fiebre, dolor articular, pérdida del apetito, náuseas y vómitos, debilidad y fatiga, color amarillento en piel y parte blanca de los ojos', 'Mediante el contacto directo con fluidos corporales infectados, generalmente a través de un pinchazo de aguja o por contacto sexual', 33690, 131407, 97717),
('Influenza', 'Fiebre, tos, dolor de garganta, congestion nasal, dolores musculares o corporales, dolores de cabeza y fatiga', 'A través de las pequeñas gotas producidas cuando las personas con influenza tose, estornudan o hablan', 1399, 910255, 908856),
('Poliomielitis', 'Fiebre, dolor de cabeza, dolor de garganta, vómitos, fatiga, pérdida de reflejos, dolores musculares intensos o debilidad, parálisis flácida', 'Transmisión feca-oral u oral-oral a través de salida de una persona infectada', 0, 350846, 350846),
('Sarampión', 'Fiebre, tos, moqueo, ojos enrojecidos y llorosos', 'Al respirar aire contaminado o al tocar una superficie contaminada y tocarse luego los ojos, la nariz o la boca (persona infectada con tos o estornudos)', 7, 144906, 144874),
('Tétanos', 'Espasmos musculares y rigidez muscular en mandíbula, tensión en músculos de los labios, espasmos dolorosos y rigidez en músculos del cuello, dificultad para tragar, músculos abdominales rígidos', 'A través de un corte o de una herida profunda que se contamina con el organismo', 3, 275085, 275085),
('Tuberculosis', 'Tos, dolor de pecho', 'A través del aire cuando una persona infectada tose, estornuda, habla o canta.', 2116, 82995, 82831),
('VIH', 'Fiebre, dolor de cabeza, dolor muscular, dolor articular, erupción, dolor de garganta, llagas dolorosas en la boca, ganglios linfáticos inflamados, diarrea, pérdida de peso', 'Relaciones sexuales o al compartir agujas, jeringas u otros implementos para la inyección de drogas', 5975, 733121, 0),
('Virus papiloma human', 'Aparición de verrugas', 'Mediante relaciones sexuales con una persona que tenga el virus', 19520, 650695, 611586);

-- --------------------------------------------------------

--
-- Table structure for table `ENFERMERO`
--

CREATE TABLE `ENFERMERO` (
  `RUT_PM` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ENFERMERO`
--

INSERT INTO `ENFERMERO` (`RUT_PM`) VALUES
('12550166-4'),
('12734953-3'),
('14561008-7'),
('15936457-7'),
('16992005-2'),
('17941121-0'),
('18357190-7'),
('19729624-0'),
('19908395-3'),
('20923739-3'),
('21412864-0'),
('24703825-6'),
('25236077-8'),
('26358122-9'),
('28169636-K'),
('29799984-2'),
('8567216-9'),
('8917057-5');

-- --------------------------------------------------------

--
-- Table structure for table `ES_CONTAGIADA_POR`
--

CREATE TABLE `ES_CONTAGIADA_POR` (
  `Rut_P` varchar(20) NOT NULL,
  `Rut_C` varchar(20) NOT NULL,
  `Parentesco` text,
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ES_CONTAGIADA_POR`
--

INSERT INTO `ES_CONTAGIADA_POR` (`Rut_P`, `Rut_C`, `Parentesco`, `Fecha`) VALUES
('10052126-1', '20293607-5', 'Trabajo', '2022-07-16'),
('10251087-9', '19322526-8', 'Desconocido', '2020-06-25'),
('10262238-3', '27808819-7', 'Desconocido', '2021-03-10'),
('10987637-2', '10907183-8', 'Desconocido', '2020-05-10'),
('11625991-5', '25805069-K', 'Universidad', '2021-10-21'),
('11722171-7', '19157451-6', 'Trabajo', '2020-08-24'),
('11756388-K', '12582458-7', 'Universidad', '2020-05-25'),
('12025007-8', '12798713-0', 'Desconocido', '2019-12-01'),
('12254594-6', '15000339-3', 'Universidad', '2019-11-20'),
('12732725-4', '19157451-6', 'Universidad', '2022-04-02'),
('12798713-0', '22311328-1', 'Trabajo', '2021-09-04'),
('13897465-0', '20869275-5', 'Familiar', '2022-03-17'),
('14097237-1', '11974084-3', 'Desconocido', '2020-05-17'),
('14493757-0', '15000339-3', 'Desconocido', '2020-08-27'),
('14657202-2', '5132016-6', 'Universidad', '2021-05-23'),
('14954220-5', '20599397-5', 'Amigo', '2020-03-02'),
('15000339-3', '20921478-4', 'Trabajo', '2020-12-08'),
('15759828-7', '8955283-4', 'Familiar', '2022-06-11'),
('16688546-9', '11722171-7', 'Amigo', '2021-12-10'),
('16968985-7', '26346325-0', 'Desconocido', '2020-02-16'),
('17254609-9', '8091091-6', 'Familiar', '2022-08-08'),
('17732337-3', '21627706-6', 'Familiar', '2021-03-04'),
('18227955-2', '12025007-8', 'Desconocido', '2020-09-21'),
('18328729-k', '12242853-2', 'Amigo', '2021-06-30'),
('18384004-5', '21530906-1', 'Universidad', '2021-04-01'),
('19091042-3', '8824295-5', 'Amigo', '2020-09-22'),
('19157451-6', '25504779-5', 'Amigo', '2020-01-09'),
('19322526-8', '17598833-5', 'Familiar', '2020-09-28'),
('19324587-0', '18328729-k', 'Familiar', '2021-10-03'),
('19875616-4', '16968985-7', 'Desconocido', '2022-02-22'),
('20020754-8', '8472487-4', 'Amigo', '2022-08-06'),
('20293607-5', '18384004-5', 'Familiar', '2022-06-20'),
('20921478-4', '25504779-5', 'Desconocido', '2021-02-19'),
('21530906-1', '12798713-0', 'Desconocido', '2021-12-08'),
('21902423-1', '11722171-7', 'Trabajo', '2020-02-24'),
('21904218-3', '28933390-8', 'Amigo', '2019-11-19'),
('22311328-1', '12025007-8', 'Universidad', '2022-01-23'),
('22487788-9', '12025007-8', 'Desconocido', '2021-12-12'),
('22569634-9', '19875616-4', 'Universidad', '2021-05-21'),
('22865103-6', '17877018-7', 'Desconocido', '2019-11-22'),
('23200250-6', '11756388-K', 'Universidad', '2021-07-08'),
('23404776-0', '19157451-6', 'Familiar', '2020-08-09'),
('23413945-2', '21627706-6', 'Familiar', '2022-01-28'),
('23648713-k', '15668430-9', 'Trabajo', '2022-07-08'),
('24106579-0', '20293607-5', 'Familiar', '2021-04-19'),
('24564009-9', '14657202-2', 'Amigo', '2022-01-19'),
('24676044-6', '8091091-6', 'Amigo', '2020-03-06'),
('24763335-9', '12242853-2', 'Amigo', '2022-04-26'),
('24923605-5', '19157451-6', 'Trabajo', '2019-11-11'),
('25207322-1', '25805069-K', 'Trabajo', '2020-10-14'),
('25501606-7', '12928017-4', 'Desconocido', '2020-07-06'),
('26601705-7', '27015464-6', 'Trabajo', '2021-02-25'),
('27015464-6', '22865103-6', 'Desconocido', '2022-04-03'),
('27623695-4', '24867555-1', 'Familiar', '2021-02-12'),
('27808819-7', '27857575-6', 'Familiar', '2020-01-05'),
('28723270-5', '24676044-6', 'Familiar', '2021-08-18'),
('28933390-8', '24676044-6', 'Familiar', '2021-08-26'),
('29493406-5', '12798713-0', 'Desconocido', '2021-03-02'),
('5132016-6', '26346325-0', 'Trabajo', '2020-03-10'),
('6043274-0', '10262238-3', 'Amigo', '2019-12-19'),
('7719667-6', '11660445-0', 'Desconocido', '2021-10-24'),
('8091091-6', '19157451-6', 'Universidad', '2020-05-18'),
('8219337-5', '9274767-0', 'Universidad', '2020-06-06'),
('8429270-2', '20869275-5', 'Universidad', '2021-04-08'),
('8472487-4', '21530906-1', 'Familiar', '2020-07-08'),
('8663749-9', '26518668-8', 'Desconocido', '2020-03-03'),
('8824295-5', '19322526-8', 'Desconocido', '2022-04-29'),
('9021477-2', '12928017-4', 'Desconocido', '2022-05-29'),
('9645958-0', '21902423-1', 'Familiar', '2020-11-28'),
('9715876-2', '14954220-5', 'Universidad', '2022-06-25');

-- --------------------------------------------------------

--
-- Table structure for table `EXTRANJERA`
--

CREATE TABLE `EXTRANJERA` (
  `ID_C` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EXTRANJERA`
--

INSERT INTO `EXTRANJERA` (`ID_C`) VALUES
('Ydf-19'),
('Nya-16'),
('Dck-19'),
('Cuh-10'),
('Rlh-17'),
('Hjw-19');

-- --------------------------------------------------------

--
-- Table structure for table `MEDICO`
--

CREATE TABLE `MEDICO` (
  `RUT_PM` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MEDICO`
--

INSERT INTO `MEDICO` (`RUT_PM`) VALUES
('11944737-2'),
('13393402-2'),
('13576291-1'),
('14028057-7'),
('14561959-9'),
('19341368-4'),
('20996010-9'),
('21775840-8'),
('21839164-8'),
('21852320-K'),
('22453577-5'),
('22651730-8'),
('23936414-4'),
('24736254-1'),
('25653519-K'),
('25701741-9'),
('26128891-5'),
('26314431-7'),
('26588880-1'),
('26989227-7'),
('27860788-7'),
('9596548-2');

-- --------------------------------------------------------

--
-- Table structure for table `NACIONAL`
--

CREATE TABLE `NACIONAL` (
  `ID_C` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NACIONAL`
--

INSERT INTO `NACIONAL` (`ID_C`) VALUES
('Lze-14'),
('Zyn-16');

-- --------------------------------------------------------

--
-- Table structure for table `PERSONA`
--

CREATE TABLE `PERSONA` (
  `Rut_P` varchar(20) NOT NULL,
  `Edad` int(3) DEFAULT NULL,
  `Nacionalidad` text,
  `Direccion` varchar(20) DEFAULT NULL,
  `Region` text,
  `Comuna` text,
  `Prevision` text,
  `RUT_PM` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PERSONA`
--

INSERT INTO `PERSONA` (`Rut_P`, `Edad`, `Nacionalidad`, `Direccion`, `Region`, `Comuna`, `Prevision`, `RUT_PM`) VALUES
('10052126-1', 18, 'Colombiana', 'Avenida Alonso De Có', 'RM', 'Vitacura', 'Fonasa', '21839164-8'),
('10251087-9', 15, 'Francesa', 'OHiggins 630', 'VIII', 'Concepción', 'Fonasa', '14028057-7'),
('10262238-3', 22, 'Taiwanesa', 'Calle Vicuña Mackenn', 'RM', 'Peñaflor', 'Fonasa', '24736254-1'),
('10907183-8', 50, 'Colombiana', 'Las Hortensias 5458', 'VIII', 'Talcahuano', 'Fonasa', '26358122-9'),
('10987637-2', 75, 'Inglesa', 'Avda. El Bosque Nort', 'RM', 'Las Condes', 'Fonasa', '26314431-7'),
('11330175-9', 40, 'Belga', 'Avenida Presidente E', 'RM', 'Renca', 'Isapre', '26588880-1'),
('11625991-5', 15, 'Chilena', 'Pasaje Uno 26 Villa ', 'VIII', 'Concepción', 'Fonasa', '14561959-9'),
('11660445-0', 17, 'Chilena', 'Calle Los Carpintero', 'IV', 'Coquimbo', 'Isapre', '26358122-9'),
('11722171-7', 71, 'Francesa', 'Calle El Teniente, 1', 'VI', 'Rancagua', 'Isapre', '26128891-5'),
('11756388-K', 29, 'Estadounidense', 'Uno Oriente 304', 'V', 'Viña del Mar', 'Fonasa', '14028057-7'),
('11780331-7', 24, 'Estadounidense', 'Calle Armando Moock,', 'RM', 'Macul', 'Fonasa', '13393402-2'),
('11974084-3', 25, 'Chilena', 'Calle Gabriel Véliz,', 'RM', 'Cerro Navia', 'Isapre', '24736254-1'),
('12025007-8', 55, 'Chilena', 'Calle Los Gobelinos,', 'RM', 'Renca', 'Isapre', '23936414-4'),
('12242853-2', 20, 'Chilena', 'Calle La Unión, 369', 'X', 'Puerto Montt', 'Isapre', '24736254-1'),
('12254594-6', 18, 'Japonesa', 'Calle Libertador B.o', 'I', 'Iquique', 'Fonasa', '25236077-8'),
('12426179-1', 56, 'Chilena', 'Calle Aníbal Pinto, ', 'VIII', 'Concepción', 'Fonasa', '18357190-7'),
('12582458-7', 20, 'Chilena', 'Jose Santos Ossa 263', 'II', 'Antofagasta', 'Isapre', '12550166-4'),
('12732725-4', 20, 'Chilena', 'Avenida Manuel Bulne', 'VIII', 'Concepción', 'Isapre', '21775840-8'),
('12798713-0', 22, 'Chilena', 'Avenida El Rodeo, 20', 'RM', 'Lo Barnechea', 'Isapre', '9596548-2'),
('12928017-4', 30, 'Belga', 'Iquique 6070', 'II', 'Antofagasta', 'Isapre', '8567216-9'),
('13897465-0', 21, 'Colombiana', 'Calle Corte Suprema,', 'RM', 'Santiago', 'Fonasa', '22651730-8'),
('13910986-4', 24, 'Rusa', 'Avenida Gran Av.josé', 'RM', 'La Cisterna', 'Fonasa', '26588880-1'),
('14097237-1', 20, 'Coreana', 'Calle Los Conquistad', 'RM', 'Providencia', 'Fonasa', '25653519-K'),
('14493757-0', 25, 'Venezolana', 'Calle Armando Concha', 'RM', 'Maipú', 'Isapre', '24736254-1'),
('14542878-5', 41, 'Chilena', 'Avenida San Pablo, 4', 'RM', 'Quinta Normal', 'Fonasa', '14561959-9'),
('14657202-2', 22, 'Suiza', 'Calle Ureta Cox, 542', 'RM', 'San Miguel', 'Isapre', '21412864-0'),
('14954220-5', 16, 'Colombiana', 'Calle Buenaventura, ', 'RM', 'Vitacura', 'Fonasa', '23936414-4'),
('15000339-3', 22, 'Chilena', 'Avenida Galvarino Ri', 'X', 'Calbuco', 'Fonasa', '13576291-1'),
('15091195-8', 74, 'Puertorriqueño', 'Calle Magdalena, 265', 'RM', 'Las Condes', 'Isapre', '26314431-7'),
('15668430-9', 43, 'Noruega', 'Pasaje Puerto Crista', 'RM', 'San Bernardo', 'Fonasa', '8917057-5'),
('15759828-7', 17, 'Chilena', 'Calle Las Urbinas, 5', 'RM', 'Providencia', 'Fonasa', '29799984-2'),
('15926482-3', 66, 'Puertorriqueño', 'Santa Ester 702', 'RM', 'San Miguel', 'Isapre', '23936414-4'),
('15944732-4', 53, 'Tailandesa', 'Calle Fernández Vial', 'VIII', 'Concepción', 'Fonasa', '26989227-7'),
('16220547-1', 34, 'Rusa', 'Dieciocho De Septiem', 'VIII', 'Chillán', 'Fonasa', '18357190-7'),
('16688546-9', 16, 'Chilena', 'Calle Club Hípico, 1', 'RM', 'Santiago', 'Isapre', '25236077-8'),
('16968985-7', 46, 'Portuguesa', 'Calle Astorga, 409', 'VI', 'Rancagua', 'Fonasa', '19341368-4'),
('17254609-9', 17, 'Rusa', 'Calle Las Heras, 199', 'VIII', 'Concepción', 'Fonasa', '21412864-0'),
('17598833-5', 27, 'Chilena', 'Camino A Nahueltoro ', 'VIII', 'Chillán', 'Isapre', '26128891-5'),
('17732337-3', 18, 'Coreana', 'Avenida Libertad, 24', 'VIII', 'Chillán', 'Fonasa', '13393402-2'),
('17877018-7', 39, 'Chilena', 'Avda. Departamental ', 'RM', 'Macul', 'Isapre', '21412864-0'),
('18227955-2', 27, 'Chilena', 'Calle Emilio Alonso,', 'VII', 'San Javier', 'Isapre', '21775840-8'),
('18328729-k', 17, 'Rumana', 'Avenida Manquehue Su', 'RM', 'Las Condes', 'Isapre', '26989227-7'),
('18384004-5', 39, 'Inglesa', 'Avda. Providencia 26', 'RM', 'Providencia', 'Fonasa', '23936414-4'),
('19091042-3', 15, 'Tailandesa', 'Calle Rosas 2625', 'RM', 'Santiago', 'Isapre', '25653519-K'),
('19157451-6', 72, 'Suiza', 'Ojos Del Salado 0851', 'RM', 'Quilicura', 'Isapre', '16992005-2'),
('19322526-8', 62, 'Mexicana', 'Av. Los Naranjos 373', 'V', 'El Quisco', 'Isapre', '25236077-8'),
('19324587-0', 20, 'Tailandesa', 'Calle Purísima, 127', 'RM', 'Recoleta', 'Fonasa', '24703825-6'),
('19389719-3', 39, 'Mexicana', 'Avenida Manquehue Su', 'RM', 'Las Condes', 'Fonasa', '12734953-3'),
('19417683-K', 41, 'Chilena', ' Avenida Potrerillos', 'II', 'Tocopilla', 'Fonasa', '25236077-8'),
('19875616-4', 40, 'Japonesa', 'Volcan Osorno 4579', 'VIII', 'Talcahuano', 'Isapre', '21839164-8'),
('19936126-0', 70, 'Ucraniana', 'Calle Pérez Román, 9', 'RM', 'El Bosque', 'Isapre', '23936414-4'),
('20020754-8', 17, 'Rusa', 'Augusto Matte 2329', 'RM', 'Quinta Normal', 'Isapre', '26989227-7'),
('20293607-5', 20, 'Tailandesa', 'Martin Alonso Pinzon', 'RM', 'Las Condes', 'Fonasa', '27860788-7'),
('20338726-1', 27, 'Chilena', 'Las Coimas 1333', 'V', 'San Felipe', 'Fonasa', '17941121-0'),
('20599397-5', 18, 'Suiza', 'Calle Arturo Prat, 5', 'RM', 'Renca', 'Isapre', '23936414-4'),
('20869275-5', 39, 'Indonesa', 'Calle Los Conquistad', 'RM', 'Providencia', 'Fonasa', '24736254-1'),
('20921478-4', 27, 'Chilena', 'Calle Vivar, 2002', 'II', 'Calama', 'Isapre', '21839164-8'),
('20948019-0', 24, 'Canadiense', '11 De Septiembre 188', 'RM', 'Providencia', 'Isapre', '24736254-1'),
('21216938-2', 73, 'Indonesa', 'Calle Aníbal Pinto, ', 'XIV', 'Valdivia', 'Fonasa', '14561008-7'),
('21530906-1', 69, 'Indonesa', 'Calle Carrera, 1907', 'V', 'Calera', 'Fonasa', '26358122-9'),
('21627706-6', 57, 'Chilena', 'Av Tobalaba 1711', 'RM', 'Santiago', 'Fonasa', '14561008-7'),
('21902423-1', 27, 'Japonesa', 'Calle Riquelme, 296', 'V', 'Limache', 'Isapre', '13576291-1'),
('21904218-3', 22, 'Estadounidense', ' Avenida Alonso De C', 'RM', 'Las Condes', 'Isapre', '21412864-0'),
('22131415-8', 20, 'Japonesa', 'San Martín 553', 'VIII', 'Concepción', 'Fonasa', '26358122-9'),
('22311328-1', 42, 'Chilena', ' Av Nueva Los Leones', 'RM', 'Santiago', 'Isapre', '24703825-6'),
('22412196-2', 25, 'Chilena', 'Avenida Américo Vesp', 'RM', 'Las Condes', 'Fonasa', '14561008-7'),
('22487788-9', 59, 'Vietnamita', 'Calle Arturo Prat, 7', 'X', 'Osorno', 'Fonasa', '24703825-6'),
('22569634-9', 63, 'Canadiense', 'Calle Condell, 378', 'VIII', 'Los Angeles', 'Fonasa', '23936414-4'),
('22865103-6', 46, 'Uruguaya', 'Chacabuco 857', 'III', 'Copiapó', 'Fonasa', '9596548-2'),
('22990898-7', 42, 'Japonesa', 'Pasaje Mascayano, 28', 'VIII', 'Concepción', 'Isapre', '23936414-4'),
('23200250-6', 70, 'Turca', 'Av Valdivieso 284', 'RM', 'Santiago', 'Isapre', '19908395-3'),
('23404776-0', 65, 'Chilena', 'Avenida Manso De Vel', 'VII', 'Curicó', 'Fonasa', '18357190-7'),
('23413945-2', 65, 'Cubana', 'Camino A Melipilla, ', 'RM', 'Maipú', 'Isapre', '15936457-7'),
('23417084-8', 57, 'Chilena', 'Calle Colón, 139', 'VIII', 'Los Angeles', 'Fonasa', '27860788-7'),
('23648713-k', 15, 'Puertorriqueño', 'Enrique Mac-Iver 267', 'RM', 'Santiago', 'Isapre', '14561959-9'),
('24106579-0', 41, 'Paraguaya', 'Calle Valdés, 678', 'RM', 'Santiago', 'Fonasa', '20996010-9'),
('24139877-3', 40, 'Chilena', 'Calle Carmen Mena, 9', 'RM', 'San Miguel', 'Fonasa', '25236077-8'),
('24153354-9', 23, 'Chilena', 'Calle Doctor Genaro ', 'VIII', 'Los Angeles', 'Isapre', '13393402-2'),
('24564009-9', 23, 'Chilena', 'Avenida Apoquindo, 5', 'RM', 'Las Condes', 'Fonasa', '25236077-8'),
('24599998-4', 21, 'Mexicana', 'Avenida Liborio Guer', 'X', 'Puerto Montt', 'Fonasa', '22453577-5'),
('24676044-6', 47, 'Chilena', 'Avenida Lo Ovalle, 5', 'RM', 'San Miguel', 'Fonasa', '19729624-0'),
('24763335-9', 15, 'Chilena', 'Pasaje Grumete Pérez', 'RM', 'Maipú', 'Fonasa', '26989227-7'),
('24867555-1', 25, 'Coreana', 'Avenida José Joaquín', 'IV', 'Coquimbo', 'Fonasa', '26989227-7'),
('24923605-5', 32, 'Irlandesa', 'Santa Rosa 0801', 'RM', 'Puente Alto', 'Isapre', '12550166-4'),
('25060792-K', 72, 'Rusa', 'Calle Mariátegui, 23', 'RM', 'Providencia', 'Isapre', '19729624-0'),
('25207322-1', 64, 'Chilena', 'Calle Los Carpintero', 'IV', 'Coquimbo', 'Isapre', '27860788-7'),
('25501606-7', 34, 'Chilena', 'Santa Elisa 554', 'RM', 'La Cisterna', 'Fonasa', '18357190-7'),
('25504779-5', 44, 'Rumana', 'Girardi 1214', 'RM', 'Providencia', 'Fonasa', '22651730-8'),
('25805069-K', 61, 'Mexicana', 'Calle Estados Unidos', 'RM', 'La Florida', 'Isapre', '29799984-2'),
('26346325-0', 57, 'Chilena', 'Avda. Balmaceda 1341', 'IV', 'La Serena', 'Isapre', '14561959-9'),
('26518668-8', 25, 'Venezolana', 'Calle Hernando De Ag', 'RM', 'Providencia', 'Fonasa', '19341368-4'),
('26601705-7', 63, 'Neozelandesa', 'Avenida El Juncal, 5', 'RM', 'Quilicura', 'Fonasa', '8567216-9'),
('27015464-6', 27, 'Puertorriqueño', 'Calle Llancahue - Km', 'XIV', 'Valdivia', 'Isapre', '24736254-1'),
('27054564-5', 20, 'Chilena', 'Ltda. San Martín 473', 'RM', 'Santiago', 'Isapre', '22453577-5'),
('27230281-2', 56, 'Japonesa', 'Avenida El Guanaco, ', 'RM', 'Recoleta', 'Fonasa', '26588880-1'),
('27623695-4', 24, 'Dominicana', 'Avenida Alemania, 06', 'IX', 'Temuco', 'Isapre', '23936414-4'),
('27808819-7', 63, 'Chilena', 'Calle Presidente Ger', 'VI', 'Rancagua', 'Fonasa', '14561008-7'),
('27857575-6', 52, 'Española', 'Lo Gallo 1815', 'RM', 'Vitacura', 'Isapre', '13576291-1'),
('28723270-5', 29, 'Chilena', 'Calle Riquelme, 776', 'I', 'Iquique', 'Isapre', '14561008-7'),
('28933390-8', 56, 'Chilena', 'Avda. Apoquindo 7032', 'RM', 'Las Condes', 'Fonasa', '14561959-9'),
('29425276-2', 40, 'Venezolana', 'Calle San Pablo 1910', 'RM', 'Santiago', 'Isapre', '27860788-7'),
('29493406-5', 20, 'Chilena', 'Calle José Joaquín P', 'RM', 'Cerro Navia', 'Fonasa', '25653519-K'),
('29498982-K', 35, 'Colombiana', 'San Francisco 2020', 'RM', 'Santiago', 'Isapre', '16992005-2'),
('5132016-6', 18, 'Cubana', 'Calle General Manuel', 'II', 'Antofagasta', 'Isapre', '19341368-4'),
('6043274-0', 25, 'Venezolana', 'Calle Las Petunias, ', 'RM', 'Puente Alto', 'Isapre', '22453577-5'),
('6992106-k', 18, 'Indonesa', 'Calle Sucre, 1571', 'II', 'Antofagasta', 'Fonasa', '22453577-5'),
('7719667-6', 19, 'Española', 'Vicuña Mackenna 2001', 'II', 'Antofagasta', 'Fonasa', '14561959-9'),
('8091091-6', 70, 'Chilena', 'Calle Luis Carrera, ', 'RM', 'Vitacura', 'Fonasa', '22453577-5'),
('8219337-5', 21, 'Chilena', 'Avenida Los Loros, 1', 'III', 'Copiapó', 'Isapre', '27860788-7'),
('8429270-2', 15, 'Chilena', 'Calle Los Industrial', 'RM', 'Macul', 'Isapre', '15936457-7'),
('8472487-4', 38, 'Taiwanesa', 'Eduardo Matte 1570', 'RM', 'Santiago', 'Isapre', '26128891-5'),
('8616345-4', 73, 'Chilena', 'Victoria 8770', 'RM', 'La Cisterna', 'Isapre', '21775840-8'),
('8663749-9', 22, 'Japonesa', 'Calle Euclides, 1453', 'RM', 'San Miguel', 'Isapre', '26128891-5'),
('8824295-5', 24, 'Rumana', 'Avenida Vitacura, 54', 'RM', 'Vitacura', 'Isapre', '14561008-7'),
('8955283-4', 33, 'Ecuatoriana', 'Calle Roble American', 'RM', 'La Florida', 'Fonasa', '21412864-0'),
('9021477-2', 71, 'Dominicana', 'Calle San Martín 080', 'RM', 'La Granja', 'Isapre', '26989227-7'),
('9051543-8', 65, 'Israelí', 'Calle Salomón Sumar,', 'RM', 'San Joaquín', 'Fonasa', '25701741-9'),
('9274767-0', 21, 'Dominicana', 'Calle Etchevers, 210', 'V', 'Viña del Mar', 'Fonasa', '26989227-7'),
('9645958-0', 20, 'Chilena', 'Calle Tucapel, 1475', 'IX', 'Temuco', 'Fonasa', '21775840-8'),
('9715876-2', 17, 'Rusa', 'Pasaje Estación Pail', 'RM', 'Puente Alto', 'Fonasa', '19341368-4');

-- --------------------------------------------------------

--
-- Table structure for table `PERSONAL_MEDICO`
--

CREATE TABLE `PERSONAL_MEDICO` (
  `RUT_PM` varchar(20) NOT NULL,
  `Tiempo_trabajando` int(20) DEFAULT NULL,
  `Titulado` date DEFAULT NULL,
  `Institucion` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PERSONAL_MEDICO`
--

INSERT INTO `PERSONAL_MEDICO` (`RUT_PM`, `Tiempo_trabajando`, `Titulado`, `Institucion`) VALUES
('10063049-4', 36, '1986-11-27', 'Universidad de Los Andes'),
('10121668-3', 36, '1986-01-29', 'Universidad Pedro de Valdivia'),
('10682905-5', 16, '2004-05-01', 'Universidad de Chile'),
('10821584-4', 2, '2015-08-10', 'Universidad del Desarrollo'),
('11788466-k', 34, '1987-09-05', 'Universidad Autonoma de Chile'),
('11944737-2', 9, '2010-05-04', 'Universidad de Atacama'),
('12202561-6', 53, '1969-09-17', 'Universidad de La Serena'),
('12550166-4', 23, '1999-11-23', 'Universidad de Los Lagos'),
('12734953-3', 37, '1985-05-17', 'Universidad Diego Portales'),
('12972762-4', 40, '1977-11-17', 'Universidad del Bio-Bio'),
('13150878-6', 8, '2010-06-17', 'Universidad de Valparaíso'),
('13275126-9', 40, '1979-05-26', 'Universidad Gabriela Mistral'),
('13374197-6', 41, '1977-07-16', 'Universidad de Concepción'),
('13393402-2', 19, '2003-07-20', 'Universidad Católica del Norte'),
('13576291-1', 17, '2005-01-16', 'Universidad del Bio-Bio'),
('13596575-8', 5, '2013-09-29', 'Universidad de Magallanes'),
('14028057-7', 32, '1986-01-13', 'Universidad de Chile'),
('14170847-3', 50, '1967-12-26', 'Universidad de Aconcagua'),
('14561008-7', 15, '2004-04-18', 'Universidad Diego Portales'),
('14561959-9', 14, '2003-02-24', 'Universidad del Desarrollo'),
('14978496-9', 48, '1974-03-20', 'Universidad del Desarrollo'),
('15355322-k', 32, '1984-03-22', 'Universidad Diego Portales'),
('15702947-9', 9, '2011-07-22', 'Universidad de Concepción'),
('15879832-8', 27, '1989-11-17', 'Universidad Diego Portales'),
('15936457-7', 12, '2004-06-26', 'Universidad Gabriela Mistral'),
('16002227-2', 7, '2014-11-03', 'Universidad de Antofagasta'),
('16656058-6', 11, '2007-04-28', 'Universidad de La Serena'),
('16992005-2', 23, '1994-07-12', 'Universidad de La Serena'),
('17229934-2', 28, '1994-02-21', 'Universidad de Antofagasta'),
('17268552-8', 38, '1984-03-19', 'Universidad de Magallanes'),
('17382983-3', 6, '2014-04-12', 'Universidad del Bio-Bio'),
('17941121-0', 22, '1999-03-05', 'Universidad de Ohiggins'),
('18100714-1', 36, '1983-12-06', 'Universidad de Valparaíso'),
('18134308-7', 4, '2017-04-27', 'Universidad Autonoma de Chile'),
('18357190-7', 18, '1999-05-21', 'Universidad del Desarrollo'),
('19341368-4', 37, '1985-10-09', 'Universidad Finis Terrae'),
('19368862-4', 30, '1992-10-13', 'Universidad de Los Lagos'),
('19563995-7', 44, '1975-01-24', 'Universidad de Los Andes'),
('19599581-8', 45, '1974-05-11', 'Universidad de Concepción'),
('19729624-0', 20, '2001-07-18', 'Universidad de Magallanes'),
('19908395-3', 35, '1986-10-19', 'Universidad Autonoma de Chile'),
('19973787-2', 36, '1982-11-27', 'Universidad Diego Portales'),
('20180166-4', 45, '1974-06-21', 'Universidad de Chile'),
('20578549-3', 13, '2005-04-22', 'Universidad de Ohiggins'),
('20699412-6', 22, '1994-06-16', 'Universidad de Santiago de Chile'),
('20751066-1', 7, '2014-10-17', 'Pontificia Universidad Católica de Chile'),
('20923739-3', 14, '2006-04-03', 'Universidad de Chile'),
('20996010-9', 19, '1998-03-28', 'Universidad de Valparaíso'),
('21412864-0', 27, '1989-03-31', 'Universidad Arturo Prat'),
('21434350-9', 8, '2009-08-12', 'Universidad de Chile'),
('21775840-8', 5, '2013-04-21', 'Universidad de Aconcagua'),
('21839164-8', 14, '2002-12-07', 'Universidad de Antofagasta'),
('21852320-K', 34, '1983-11-14', 'Universidad Autonoma de Chile'),
('21965856-7', 51, '1968-05-21', 'Universidad Santo Tomás'),
('22014791-6', 0, '2017-10-25', 'Universidad de Antofagasta'),
('22371206-1', 18, '2004-05-21', 'Universidad de Concepción'),
('22413078-3', 17, '2004-08-17', 'Universidad de La Serena'),
('22453577-5', 32, '1990-04-10', 'Universidad Mayor'),
('22602198-1', 45, '1974-03-26', 'Universidad Autonoma de Chile'),
('22640700-6', 6, '2012-06-07', 'Universidad de Tarapaca'),
('22651730-8', 47, '1971-06-29', 'Pontificia Universidad Católica de Chile'),
('23357690-5', 28, '1994-10-26', 'Universidad Santo Tomás'),
('23680366-k', 42, '1977-08-14', 'Universidad de Chile'),
('23752945-6', 35, '1972-08-19', 'Pontificia Universidad Católica de Chile'),
('23847392-6', 25, '1991-04-13', 'Universidad de Antofagasta'),
('23934907-2', 5, '2013-06-22', 'Universidad Finis Terrae'),
('23936414-4', 35, '1981-01-29', 'Universidad Andrés Bello'),
('24520659-3', 21, '2000-03-31', 'Universidad Diego Portales'),
('24659275-6', 19, '2003-11-26', 'Universidad de Antofagasta'),
('24703825-6', 55, '1967-10-12', 'Universidad de Santiago de Chile'),
('24736254-1', 25, '1996-11-13', 'Universidad de Concepción'),
('25236077-8', 13, '2008-05-08', 'Pontificia Universidad Católica de Chile'),
('25653519-K', 37, '1984-03-25', 'Universidad de Antofagasta'),
('25701741-9', 50, '1969-03-06', 'Universidad del Bio-Bio'),
('26128891-5', 21, '1995-09-03', 'Universidad del Bio-Bio'),
('26314431-7', 49, '1967-12-18', 'Universidad Gabriela Mistral'),
('26358122-9', 21, '1995-03-19', 'Universidad Diego Portales'),
('26588880-1', 22, '1996-12-11', 'Universidad Pedro de Valdivia'),
('26989227-7', 14, '2003-07-24', 'Universidad de Los Andes'),
('27860788-7', 45, '1975-10-04', 'Universidad de La Serena'),
('28169636-K', 16, '2005-11-12', 'Pontificia Universidad Católica de Chile'),
('29799984-2', 37, '1984-09-21', 'Universidad de Antofagasta'),
('5074050-1', 49, '1971-02-18', 'Universidad Gabriela Mistral'),
('5711662-5', 21, '1999-01-08', 'Universidad Autonoma de Chile'),
('6574264-0', 22, '1999-01-01', 'Universidad Diego Portales'),
('7564310-1', 39, '1979-05-05', 'Pontificia Universidad Católica de Chile'),
('7815972-3', 12, '2008-05-28', 'Universidad Pedro de Valdivia'),
('8107082-2', 44, '1972-11-04', 'Universidad de Tarapaca'),
('8320358-7', 37, '1979-07-29', 'Universidad de La Serena'),
('8337998-7', 52, '1970-01-12', 'Universidad de Concepción'),
('8516338-8', 8, '2014-12-08', 'Universidad Diego Portales'),
('8567216-9', 41, '1973-09-22', 'Universidad de Tarapaca'),
('8723169-0', 44, '1972-07-05', 'Universidad de Tarapaca'),
('8917057-5', 37, '1979-11-23', 'Universidad de Tarapaca'),
('9010781-k', 13, '2005-12-02', 'Universidad Pedro de Valdivia'),
('9058099-k', 52, '1970-01-30', 'Universidad del Desarrollo'),
('9369750-2', 46, '1972-05-12', 'Universidad Finis Terrae'),
('9449197-5', 55, '1967-11-19', 'Universidad de Chile'),
('9458119-2', 8, '2009-12-03', 'Universidad de Valparaíso'),
('9596548-2', 48, '1974-07-09', 'Universidad Santo Tomás');

-- --------------------------------------------------------

--
-- Table structure for table `PRUEBA`
--

CREATE TABLE `PRUEBA` (
  `ID_P` varchar(20) NOT NULL,
  `RUT_PM` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PRUEBA`
--

INSERT INTO `PRUEBA` (`ID_P`, `RUT_PM`) VALUES
('NAH-00', '11111111-1'),
('FZX-35', '12550166-4'),
('GOL-65', '12550166-4'),
('OXH-88', '12550166-4'),
('QOR-21', '12550166-4'),
('QWL-87', '12550166-4'),
('ZBF-42', '12550166-4'),
('AJX-78', '12734953-3'),
('CNA-49', '12734953-3'),
('FKC-20', '12734953-3'),
('IOI-23', '12734953-3'),
('JYO-81', '12734953-3'),
('LEP-14', '12734953-3'),
('QYV-25', '12734953-3'),
('TUD-80', '12734953-3'),
('ELG-66', '14561008-7'),
('IVU-95', '14561008-7'),
('MOV-99', '14561008-7'),
('NPZ-13', '14561008-7'),
('WHD-59', '14561008-7'),
('YPW-32', '14561008-7'),
('CTI-83', '15936457-7'),
('HIM-27', '15936457-7'),
('QMY-34', '15936457-7'),
('WLN-26', '15936457-7'),
('AAB-49', '16992005-2'),
('DGA-51', '16992005-2'),
('GNY-54', '16992005-2'),
('MYI-99', '16992005-2'),
('NRK-51', '16992005-2'),
('TQX-63', '16992005-2'),
('UFP-24', '16992005-2'),
('WGW-11', '16992005-2'),
('XMV-56', '16992005-2'),
('XMZ-19', '16992005-2'),
('YOC-75', '16992005-2'),
('AXS-76', '17941121-0'),
('KCC-15', '17941121-0'),
('UIE-60', '17941121-0'),
('VCK-13', '17941121-0'),
('ABN-56', '18357190-7'),
('BVM-35', '18357190-7'),
('OTX-69', '18357190-7'),
('PHE-84', '18357190-7'),
('SIZ-52', '18357190-7'),
('BGE-38', '19729624-0'),
('DDS-87', '19729624-0'),
('ESY-99', '19729624-0'),
('FFB-25', '19729624-0'),
('KHR-46', '19729624-0'),
('MFB-34', '19729624-0'),
('RAX-80', '19729624-0'),
('TUO-68', '19729624-0'),
('TXY-17', '19729624-0'),
('ZUI-73', '19729624-0'),
('HVQ-89', '19908395-3'),
('HWJ-52', '19908395-3'),
('OIS-83', '19908395-3'),
('RLX-12', '19908395-3'),
('VST-85', '19908395-3'),
('CBA-50', '20923739-3'),
('KPV-31', '20923739-3'),
('ODX-93', '20923739-3'),
('TNI-30', '20923739-3'),
('TVU-16', '20923739-3'),
('BCX-25', '21412864-0'),
('FXY-92', '21412864-0'),
('IKR-28', '21412864-0'),
('KIL-36', '21412864-0'),
('PHX-57', '21412864-0'),
('PLD-21', '21412864-0'),
('VSI-98', '21412864-0'),
('HVV-43', '24703825-6'),
('OAL-72', '24703825-6'),
('PMQ-60', '24703825-6'),
('YFY-79', '24703825-6'),
('BIZ-92', '25236077-8'),
('CMS-61', '25236077-8'),
('WAG-24', '25236077-8'),
('LPV-70', '26358122-9'),
('OGZ-73', '26358122-9'),
('OZO-23', '26358122-9'),
('PGM-41', '26358122-9'),
('UPW-96', '26358122-9'),
('WIY-85', '26358122-9'),
('XWO-67', '26358122-9'),
('YOV-41', '26358122-9'),
('ZME-83', '26358122-9'),
('AHV-64', '28169636-K'),
('EBU-49', '28169636-K'),
('OTI-31', '28169636-K'),
('TST-52', '28169636-K'),
('XOJ-63', '28169636-K'),
('ZNA-49', '28169636-K'),
('AJV-43', '29799984-2'),
('BEB-51', '29799984-2'),
('INH-20', '29799984-2'),
('PTI-26', '29799984-2'),
('SPI-55', '29799984-2'),
('TYJ-21', '29799984-2'),
('VGP-49', '29799984-2'),
('XWL-72', '29799984-2'),
('YIZ-17', '29799984-2'),
('YNF-66', '29799984-2'),
('EJN-18', '8567216-9'),
('EVB-60', '8567216-9'),
('GAK-65', '8567216-9'),
('GTD-36', '8567216-9'),
('KXG-64', '8567216-9'),
('MST-73', '8567216-9'),
('QXN-90', '8567216-9'),
('TUV-49', '8567216-9'),
('XMM-57', '8567216-9'),
('ZHN-50', '8567216-9'),
('BVT-41', '8917057-5'),
('DES-31', '8917057-5'),
('HFC-82', '8917057-5'),
('HRC-85', '8917057-5'),
('IBD-87', '8917057-5'),
('JVY-54', '8917057-5'),
('UTO-27', '8917057-5');

-- --------------------------------------------------------

--
-- Table structure for table `PUEDE_ASISTIR_A`
--

CREATE TABLE `PUEDE_ASISTIR_A` (
  `Rut_P` varchar(20) NOT NULL,
  `ID_CS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PUEDE_ASISTIR_A`
--

INSERT INTO `PUEDE_ASISTIR_A` (`Rut_P`, `ID_CS`) VALUES
('12254594-6', 'CA-56'),
('20948019-0', 'CALD-10'),
('10262238-3', 'CAO-17'),
('14657202-2', 'CAO-17'),
('24139877-3', 'CAO-17'),
('26346325-0', 'CAO-17'),
('25805069-K', 'CASA-81'),
('6992106-k', 'CASA-81'),
('12732725-4', 'CAT-61'),
('26346325-0', 'CAT-61'),
('11722171-7', 'CAV-71'),
('21904218-3', 'CAV-71'),
('22311328-1', 'CAV-71'),
('8219337-5', 'CAV-71'),
('10251087-9', 'CB-15'),
('22569634-9', 'CB-15'),
('27015464-6', 'CB-15'),
('28933390-8', 'CB-15'),
('27808819-7', 'CC-15'),
('5132016-6', 'CC-15'),
('24564009-9', 'CC-33'),
('19389719-3', 'CCMA-64'),
('24106579-0', 'CCMA-64'),
('9051543-8', 'CCMA-64'),
('18227955-2', 'CCSFDCS-58'),
('24153354-9', 'CCSFDCS-58'),
('17877018-7', 'CCSFE-56'),
('20293607-5', 'CCSFEA-28'),
('19091042-3', 'CCSFEP-57'),
('24106579-0', 'CCSFEP-57'),
('24599998-4', 'CCSFEP-57'),
('12732725-4', 'CCSFL-40'),
('27015464-6', 'CCSFLLUVN-11'),
('25805069-K', 'CCSFM-28'),
('23413945-2', 'CCSFM-81'),
('26346325-0', 'CCSFM-81'),
('25805069-K', 'CCSFO-39'),
('18227955-2', 'CD-40'),
('24676044-6', 'CD-40'),
('26518668-8', 'CD-40'),
('8091091-6', 'CD-40'),
('8824295-5', 'CD-40'),
('11625991-5', 'CDV-43'),
('19091042-3', 'CDV-43'),
('8091091-6', 'CDV-43'),
('13910986-4', 'CI-14'),
('11780331-7', 'CIMM-33'),
('14097237-1', 'CIMM-33'),
('11625991-5', 'CIR-19'),
('12242853-2', 'CIT-38'),
('21627706-6', 'CIT-38'),
('10052126-1', 'CLA-56'),
('25060792-K', 'CLC-42'),
('20293607-5', 'CLC-52'),
('10907183-8', 'CLL-21'),
('20338726-1', 'CLL-21'),
('12582458-7', 'CLL-58'),
('25207322-1', 'CLV-36'),
('29498982-K', 'CLV-36'),
('10052126-1', 'CM-24'),
('12582458-7', 'CM-24'),
('21902423-1', 'CMCENTROMED-35'),
('14493757-0', 'CMCHP-66'),
('14954220-5', 'CMCHP-66'),
('15759828-7', 'CMCSMLD-19'),
('8955283-4', 'CMN-84'),
('9021477-2', 'CMN-84'),
('20599397-5', 'CMOCS-45'),
('22412196-2', 'CMOCS-45'),
('11756388-K', 'CMOS-79'),
('17254609-9', 'CMOS-79'),
('18328729-k', 'CMOS-79'),
('24923605-5', 'CMOS-79'),
('19157451-6', 'CMS-16'),
('24139877-3', 'CMS-16'),
('8219337-5', 'CMS-16'),
('11722171-7', 'CMSJCEDIUC-42'),
('19091042-3', 'CMSJCEDIUC-42'),
('21216938-2', 'CMSJCEDIUC-42'),
('27054564-5', 'CMVIA-18'),
('14542878-5', 'CMVIT-16'),
('16688546-9', 'CPM-49'),
('27054564-5', 'CPS-66'),
('8219337-5', 'CPS-66'),
('19322526-8', 'CSA-42'),
('15944732-4', 'CSAC-27'),
('23404776-0', 'CSAC-27'),
('24564009-9', 'CSAC-27'),
('11625991-5', 'CSCA-11'),
('23413945-2', 'CSCA-11'),
('9051543-8', 'CSCA-11'),
('23648713-k', 'CSFAREC-62'),
('10262238-3', 'CSFC-43'),
('11780331-7', 'CSFC-43'),
('17877018-7', 'CSFC-43'),
('19091042-3', 'CSFC-43'),
('22131415-8', 'CSFC-43'),
('29425276-2', 'CSFC-43'),
('27623695-4', 'CSFCN-70'),
('11756388-K', 'CSFDAS-11'),
('15668430-9', 'CSFDAS-11'),
('9715876-2', 'CSFDAS-11'),
('11660445-0', 'CSFDMS-13'),
('25805069-K', 'CSFDMS-13'),
('12242853-2', 'CSFEQ-21'),
('11722171-7', 'CSFPN-23'),
('11625991-5', 'CSM-42'),
('12254594-6', 'CSM-42'),
('12732725-4', 'CSM-42'),
('19091042-3', 'CSM-42'),
('23417084-8', 'CSM-42'),
('27808819-7', 'CSM-42'),
('15944732-4', 'CT-13'),
('10052126-1', 'CT-81'),
('19324587-0', 'CT-81'),
('20293607-5', 'CT-81'),
('23200250-6', 'CT-81'),
('19875616-4', 'CV-18'),
('15926482-3', 'CVILC-34'),
('24599998-4', 'CVILC-34'),
('29498982-K', 'CVILC-34'),
('24763335-9', 'CVILF-17'),
('9021477-2', 'CVIM-20'),
('12025007-8', 'CVIPA-67'),
('14542878-5', 'CVIPA-67'),
('17877018-7', 'CVIQ-37'),
('25060792-K', 'CVIQ-37'),
('9021477-2', 'CVISM-61'),
('20020754-8', 'HBSJO-15'),
('27015464-6', 'HBSJO-15'),
('21904218-3', 'HCMECDLVF-16'),
('22311328-1', 'HCMLFDEDI-62'),
('25207322-1', 'HCRV-11'),
('27623695-4', 'HCRV-11'),
('24923605-5', 'HCSB-12'),
('14097237-1', 'HCSSA-37'),
('9715876-2', 'HCVM-16'),
('24564009-9', 'HDFBCSQN-26'),
('16220547-1', 'HDHHAT-16'),
('19875616-4', 'HDHHAT-16'),
('14542878-5', 'HDSSP-31'),
('9715876-2', 'HDSSP-31'),
('24599998-4', 'HDTHM-10'),
('6992106-k', 'HDTHM-10'),
('18227955-2', 'HEPSSB-17'),
('8616345-4', 'HIA-19'),
('12254594-6', 'HLHT-72'),
('19091042-3', 'HLHT-72'),
('6992106-k', 'HLHT-72'),
('27054564-5', 'HP-25'),
('15759828-7', 'HSJDLS-99'),
('23648713-k', 'IB-17'),
('5132016-6', 'IFV-76'),
('11722171-7', 'ILC-41'),
('22131415-8', 'ILC-41'),
('24923605-5', 'ILC-41'),
('25805069-K', 'ILC-41'),
('27230281-2', 'ILC-41'),
('16688546-9', 'IMI-16'),
('20599397-5', 'IMI-16'),
('25504779-5', 'IMI-16'),
('26601705-7', 'IMI-16'),
('17598833-5', 'IMPS-29'),
('19091042-3', 'IMPS-29'),
('24599998-4', 'IPA-28'),
('11722171-7', 'IR-42'),
('12798713-0', 'IR-42'),
('15926482-3', 'IR-42'),
('24139877-3', 'IR-42'),
('29493406-5', 'IR-42'),
('12732725-4', 'IVM-86'),
('22990898-7', 'NCC-72'),
('9021477-2', 'NCC-72'),
('11625991-5', 'PI-13'),
('22131415-8', 'PI-13'),
('27054564-5', 'PI-13'),
('12242853-2', 'PNPM-26'),
('15000339-3', 'PNPM-26'),
('21904218-3', 'PNPM-26'),
('6992106-k', 'PSMP-16');

-- --------------------------------------------------------

--
-- Table structure for table `PUNTO_DE_VACUNACION`
--

CREATE TABLE `PUNTO_DE_VACUNACION` (
  `ID_PV` varchar(20) NOT NULL,
  `Nombre_V` varchar(20) NOT NULL,
  `Tipo_Dosis` text,
  `Cantidad` int(5) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Tipo_establecimiento` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PUNTO_DE_VACUNACION`
--

INSERT INTO `PUNTO_DE_VACUNACION` (`ID_PV`, `Nombre_V`, `Tipo_Dosis`, `Cantidad`, `Direccion`, `Tipo_establecimiento`) VALUES
('CCSFA-12', 'Astrazeneca', 'Primera dosis', 868, 'Calle Segunda Avenida 1462', 'CESFAM'),
('CCSFAN-14', 'Fluarix Tetra', 'Dosis Unica', 176, 'Calle Los Mañios, Alerce Norte', 'CESFAM'),
('CCSFAN-14', 'Gardasil', 'Dosis Unica', 176, 'Calle Los Mañios, Alerce Norte', 'CESFAM'),
('CCSFB-28', 'Moderna', 'Primera dosis', 447, 'Calle Getsemani 229', 'CESFAM'),
('CCSFB-28', 'Pfizer', 'Primera dosis', 447, 'Calle Getsemani 229', 'CESFAM'),
('CCSFBPH-19', 'Astrazeneca', 'Primera dosis', 899, 'Calle Parroquia Nuestra Señora', 'CESFAM'),
('CCSFBPH-19', 'Moderna', 'Primera dosis', 899, 'Calle Parroquia Nuestra Señora', 'CESFAM'),
('CCSFBPH-19', 'Pfizer', 'Primera dosis', 899, 'Calle Parroquia Nuestra Señora', 'CESFAM'),
('CCSFBPH-19', 'Sinovac', 'Primera dosis', 899, 'Calle Parroquia Nuestra Señora', 'CESFAM'),
('CCSFCP-17', 'Pfizer', 'Segunda dosis', 892, 'Calle Los Arcángeles 1249', 'CESFAM'),
('CCSFDI-12', 'BCG', 'Dosis Unica', 196, 'Calle L. Arellano 1780', 'CESFAM'),
('CCSFDI-12', 'Tresvírica', 'Dosis Unica', 196, 'Calle L. Arellano 1780', 'CESFAM'),
('CCSFDI-12', 'Twinrix', 'Dosis Unica', 196, 'Calle L. Arellano 1780', 'CESFAM'),
('CCSFEC-57', 'tOPV', 'Dosis Unica', 83, 'Calle Marín 520', 'CESFAM'),
('CCSFEC-57', 'Twinrix', 'Dosis Unica', 83, 'Calle Marín 520', 'CESFAM'),
('CCSFG-14', 'Astrazeneca', 'Segunda dosis', 389, 'Calle Las Mulatas 311', 'CESFAM'),
('CCSFG-14', 'Moderna', 'Segunda dosis', 389, 'Calle Las Mulatas 311', 'CESFAM'),
('CCSFG-14', 'Sinovac', 'Segunda dosis', 389, 'Calle Las Mulatas 311', 'CESFAM'),
('CCSFIN-12', 'dTpa', 'Dosis Unica', 155, 'Calle Isidoro Dubournais 4100', 'CESFAM'),
('CCSFIN-12', 'tOPV', 'Dosis Unica', 155, 'Calle Isidoro Dubournais 4100', 'CESFAM'),
('CCSFIN-12', 'Tresvírica', 'Dosis Unica', 155, 'Calle Isidoro Dubournais 4100', 'CESFAM'),
('CCSFIN-12', 'Twinrix', 'Dosis Unica', 155, 'Calle Isidoro Dubournais 4100', 'CESFAM'),
('CCSFSG-81', 'BCG', 'Dosis Unica', 140, 'Calle Angol 8363', 'CESFAM'),
('CCSFSG-81', 'dTpa', 'Dosis Unica', 140, 'Calle Angol 8363', 'CESFAM'),
('CCSFSG-81', 'Fluarix Tetra', 'Dosis Unica', 140, 'Calle Angol 8363', 'CESFAM'),
('CCSFSG-81', 'Gardasil', 'Dosis Unica', 140, 'Calle Angol 8363', 'CESFAM'),
('CCSFSG-81', 'tOPV', 'Dosis Unica', 140, 'Calle Angol 8363', 'CESFAM'),
('CCSFSL-17', 'Astrazeneca', 'Primera dosis', 675, 'Calle Neptuno 2198', 'CESFAM'),
('CCSFSL-17', 'Sinovac', 'Segunda dosis', 881, 'Calle Picton 1050', 'CESFAM'),
('CCSFSPM-15', 'dTpa', 'Dosis Unica', 145, 'Calle Huérfanos 4490', 'CESFAM'),
('CCSFSPM-15', 'Fluarix Tetra', 'Dosis Unica', 145, 'Calle Huérfanos 4490', 'CESFAM'),
('CCSFSPM-15', 'tOPV', 'Dosis Unica', 145, 'Calle Huérfanos 4490', 'CESFAM'),
('CCSFSPM-15', 'Tresvírica', 'Dosis Unica', 145, 'Calle Huérfanos 4490', 'CESFAM'),
('CCSFSPM-15', 'Twinrix', 'Dosis Unica', 145, 'Calle Huérfanos 4490', 'CESFAM'),
('CCSFT-17', 'dTpa', 'Dosis Unica', 90, 'Calle Pedro Félix, Sector San ', 'CESFAM'),
('CCSFT-17', 'tOPV', 'Dosis Unica', 90, 'Calle Pedro Félix, Sector San ', 'CESFAM'),
('CCSFT-17', 'Twinrix', 'Dosis Unica', 90, 'Calle Pedro Félix, Sector San ', 'CESFAM'),
('CCSFVC-11', 'Astrazeneca', 'Primera dosis', 666, 'Avenida Punta Peñablanca, Vill', 'CESFAM'),
('CCSFVH-13', 'Tresvírica', 'Dosis Unica', 59, 'Avenida Alemania 850', 'CESFAM'),
('CCSFY-17', 'Moderna', 'Tercera dosis', 387, 'Calle Yalta 2500', 'CESFAM'),
('CMDCAPREDENA-15', 'Sinovac', 'Tercera dosis', 442, 'Avenida Bulnes 284', 'CESFAM'),
('CMDM-18', 'Sinovac', 'Primera dosis', 763, 'Calle Matucana, Piso 2 727', 'CESFAM'),
('CMM-28', 'Astrazeneca', 'Primera dosis', 768, 'Calle Macul 2555', 'CESFAM'),
('CMM-28', 'Moderna', 'Primera dosis', 768, 'Calle Macul 2555', 'CESFAM'),
('CMM-28', 'Sinovac', 'Primera dosis', 768, 'Calle Macul 2555', 'CESFAM'),
('CMMPM-12', 'BCG', 'Dosis Unica', 131, 'Calle Benavente 458', 'CESFAM'),
('CMMPM-12', 'Tresvírica', 'Dosis Unica', 131, 'Calle Benavente 458', 'CESFAM'),
('CPEL-90', 'Tresvírica', 'Dosis Unica', 78, 'Calle Chorrillos 922', 'Consultorio'),
('CPEL-90', 'Twinrix', 'Dosis Unica', 78, 'Calle Chorrillos 922', 'Consultorio'),
('CSCEDIMED-13', 'Twinrix', 'Dosis Unica', 135, 'Calle Salas 173', 'CESFAM'),
('CSFA-12', 'tOPV', 'Dosis Unica', 112, 'Calle Santa Martina 3821', 'CESFAM'),
('CSFA-12', 'Twinrix', 'Dosis Unica', 112, 'Calle Santa Martina 3821', 'CESFAM'),
('CSFA-13', 'BCG', 'Dosis Unica', 85, 'Calle Camilo Henríquez 88', 'CESFAM'),
('CSFA-19', 'tOPV', 'Dosis Unica', 89, 'Calle Garibaldi 1280', 'CESFAM'),
('CSFA-20', 'Astrazeneca', 'Tercera dosis', 743, 'Calle El Aguilucho 3292', 'CESFAM'),
('CSFA-20', 'Sinovac', 'Tercera dosis', 743, 'Calle El Aguilucho 3292', 'CESFAM'),
('CSFA-62', 'Astrazeneca', 'Tercera dosis', 793, 'Calle Cerro Altar 6611', 'CESFAM'),
('CSFA-62', 'Moderna', 'Tercera dosis', 793, 'Calle Cerro Altar 6611', 'CESFAM'),
('CSFA-62', 'Pfizer', 'Tercera dosis', 793, 'Calle Cerro Altar 6611', 'CESFAM'),
('CSFA-62', 'Sinovac', 'Tercera dosis', 793, 'Calle Cerro Altar 6611', 'CESFAM'),
('CSFB-65', 'dTpa', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFB-65', 'Fluarix Tetra', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFB-65', 'Gardasil', 'Dosis Unica', 141, 'Calle Froilan Roa 6420', 'CESFAM'),
('CSFB-65', 'tOPV', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFB-65', 'Twinrix', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFBL-11', 'Pfizer', 'Segunda dosis', 679, 'Calle Ángel Guarello 1319', 'CESFAM'),
('CSFBL-19', 'Astrazeneca', 'Segunda dosis', 677, 'Calle Miguel Ángel 1929', 'CESFAM'),
('CSFBZ-14', 'Sinovac', 'Tercera dosis', 734, 'Calle Blanca Vergara 1794', 'CESFAM'),
('CSFC-14', 'Fluarix Tetra', 'Dosis Unica', 58, 'Calle Eulogio Goycolea, esquin', 'CESFAM'),
('CSFCB-96', 'Moderna', 'Segunda dosis', 752, 'Calle Los Trabajadores 999', 'CESFAM'),
('CSFCB-96', 'Pfizer', 'Segunda dosis', 752, 'Calle Los Trabajadores 999', 'CESFAM'),
('CSFCB-96', 'Sinovac', 'Segunda dosis', 752, 'Calle Los Trabajadores 999', 'CESFAM'),
('CSFCC-17', 'dTpa', 'Dosis Unica', 175, 'Avenida Freire 189', 'CESFAM'),
('CSFCC-17', 'Fluarix Tetra', 'Dosis Unica', 175, 'Avenida Freire 189', 'CESFAM'),
('CSFCC-17', 'tOPV', 'Dosis Unica', 175, 'Avenida Freire 189', 'CESFAM'),
('CSFCC-17', 'Twinrix', 'Dosis Unica', 175, 'Avenida Freire 189', 'CESFAM'),
('CSFCC-54', 'Astrazeneca', 'Tercera dosis', 859, 'Calle Agusto D`Almar 555', 'CESFAM'),
('CSFCC-54', 'Pfizer', 'Tercera dosis', 859, 'Calle Agusto D`Almar 555', 'CESFAM'),
('CSFCC-54', 'Sinovac', 'Tercera dosis', 859, 'Calle Agusto D`Almar 555', 'CESFAM'),
('CSFDAA-10', 'Moderna', 'Tercera dosis', 649, 'Calle Las Torres 1204', 'CESFAM'),
('CSFDAA-10', 'Sinovac', 'Tercera dosis', 649, 'Calle Las Torres 1204', 'CESFAM'),
('CSFDFM-72', 'BCG', 'Dosis Unica', 188, 'Calle La Concepción 73', 'CESFAM'),
('CSFDFM-72', 'Fluarix Tetra', 'Dosis Unica', 188, 'Calle La Concepción 73', 'CESFAM'),
('CSFDFM-72', 'Gardasil', 'Dosis Unica', 188, 'Calle La Concepción 73', 'CESFAM'),
('CSFDFM-72', 'Tresvírica', 'Dosis Unica', 188, 'Calle La Concepción 73', 'CESFAM'),
('CSFDLF-56', 'dTpa', 'Dosis Unica', 188, 'Calle Tierra Fértil 5161', 'CESFAM'),
('CSFDLF-56', 'tOPV', 'Dosis Unica', 188, 'Calle Tierra Fértil 5161', 'CESFAM'),
('CSFDLF-56', 'Tresvírica', 'Dosis Unica', 188, 'Calle Tierra Fértil 5161', 'CESFAM'),
('CSFDLF-56', 'Twinrix', 'Dosis Unica', 188, 'Calle Tierra Fértil 5161', 'CESFAM'),
('CSFEFM-17', 'Moderna', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFEM-10', 'Sinovac', 'Segunda dosis', 361, 'Calle Camino Santa Teresa 1876', 'CESFAM'),
('CSFER-10', 'Astrazeneca', 'Tercera dosis', 453, 'Avenida Oriente 2201', 'CESFAM'),
('CSFER-10', 'Pfizer', 'Tercera dosis', 453, 'Avenida Oriente 2201', 'CESFAM'),
('CSFER-10', 'Sinovac', 'Tercera dosis', 453, 'Avenida Oriente 2201', 'CESFAM'),
('CSFES-89', 'BCG', 'Dosis Unica', 170, 'Calle Los Olivos, Sector El Sa', 'CESFAM'),
('CSFES-89', 'Fluarix Tetra', 'Dosis Unica', 170, 'Calle Los Olivos, Sector El Sa', 'CESFAM'),
('CSFES-89', 'Gardasil', 'Dosis Unica', 170, 'Calle Los Olivos, Sector El Sa', 'CESFAM'),
('CSFES-89', 'tOPV', 'Dosis Unica', 170, 'Calle Los Olivos, Sector El Sa', 'CESFAM'),
('CSFEV-10', 'Astrazeneca', 'Tercera dosis', 379, 'Avenida Francia 2980', 'CESFAM'),
('CSFG-10', 'BCG', 'Dosis Unica', 126, 'Calle Janequeo 5612', 'CESFAM'),
('CSFG-10', 'Gardasil', 'Dosis Unica', 126, 'Calle Janequeo 5612', 'CESFAM'),
('CSFG-10', 'Tresvírica', 'Dosis Unica', 126, 'Calle Janequeo 5612', 'CESFAM'),
('CSFGS-11', 'Moderna', 'Segunda dosis', 629, 'Avenida Sofía Eastman 10009', 'CESFAM'),
('CSFGS-11', 'Pfizer', 'Segunda dosis', 629, 'Avenida Sofía Eastman 10009', 'CESFAM'),
('CSFGS-11', 'Sinovac', 'Segunda dosis', 629, 'Avenida Sofía Eastman 10009', 'CESFAM'),
('CSFIFC-14', 'Moderna', 'Segunda dosis', 417, 'Calle San Luis 525', 'CESFAM'),
('CSFIFC-14', 'Pfizer', 'Segunda dosis', 417, 'Calle San Luis 525', 'CESFAM'),
('CSFJA-11', 'tOPV', 'Dosis Unica', 115, 'Calle Márquez de la Plata 5', 'CESFAM'),
('CSFJPII-32', 'dTpa', 'Dosis Unica', 131, 'Calle Isidora Campaña 3397', 'CESFAM'),
('CSFJPII-32', 'Fluarix Tetra', 'Dosis Unica', 131, 'Calle Isidora Campaña 3397', 'CESFAM'),
('CSFJPII-32', 'Gardasil', 'Dosis Unica', 131, 'Calle Isidora Campaña 3397', 'CESFAM'),
('CSFJPII-32', 'tOPV', 'Dosis Unica', 131, 'Calle Isidora Campaña 3397', 'CESFAM'),
('CSFL-15', 'dTpa', 'Dosis Unica', 50, 'Calle Uno Norte 11', 'CESFAM'),
('CSFLA-27', 'Astrazeneca', 'Tercera dosis', 649, 'Calle Las Torres 1204', 'CESFAM'),
('CSFLA-27', 'Moderna', 'Tercera dosis', 649, 'Calle Las Torres 1204', 'CESFAM'),
('CSFLA-27', 'Pfizer', 'Tercera dosis', 649, 'Calle Las Torres 1204', 'CESFAM'),
('CSFLB-16', 'Moderna', 'Segunda dosis', 561, 'Avenida El Rodeo 13533', 'CESFAM'),
('CSFLQ-11', 'BCG', 'Dosis Unica', 93, 'Calle Julio César 10905', 'CESFAM'),
('CSFLQ-11', 'Tresvírica', 'Dosis Unica', 93, 'Calle Julio César 10905', 'CESFAM'),
('CSFN-19', 'Moderna', 'Segunda dosis', 391, 'Calle Unión Latinoamericana 98', 'CESFAM'),
('CSFNSIC-18', 'Pfizer', 'Tercera dosis', 420, 'Avenida Constanza 1790', 'CESFAM'),
('CSFO-14', 'BCG', 'Dosis Unica', 119, 'Calle Martín Ruiz de Gamboa 60', 'CESFAM'),
('CSFO-14', 'Gardasil', 'Dosis Unica', 119, 'Calle Martín Ruiz de Gamboa 60', 'CESFAM'),
('CSFPA-13', 'tOPV', 'Dosis Unica', 155, 'Calle Los Héroes de La Concepc', 'CESFAM'),
('CSFPA-13', 'Tresvírica', 'Dosis Unica', 155, 'Calle Los Héroes de La Concepc', 'CESFAM'),
('CSFPA-13', 'Twinrix', 'Dosis Unica', 155, 'Calle Los Héroes de La Concepc', 'CESFAM'),
('CSFPLG-12', 'dTpa', 'Dosis Unica', 129, 'Calle Flora Normilla 1007', 'CESFAM'),
('CSFPLG-12', 'tOPV', 'Dosis Unica', 129, 'Calle Flora Normilla 1007', 'CESFAM'),
('CSFPLG-12', 'Twinrix', 'Dosis Unica', 129, 'Calle Flora Normilla 1007', 'CESFAM'),
('CSFQB-20', 'Twinrix', 'Dosis Unica', 153, 'Calle Justicia Social 185', 'CESFAM'),
('CSFR-17', 'Moderna', 'Tercera dosis', 473, 'Avenida Recoleta 740', 'CESFAM'),
('CSFR-18', 'Pfizer', 'Primera dosis', 870, 'Calle Balmaceda 4420', 'CESFAM'),
('CSFSA-80', 'BCG', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFSA-80', 'Fluarix Tetra', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFSA-80', 'Gardasil', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFSA-80', 'Tresvírica', 'Primera dosis', 355, 'Avenida Ossa 140', 'CESFAM'),
('CSFSJ-13', 'dTpa', 'Dosis Unica', 107, 'Calle Francisca de Rimini 3223', 'CESFAM'),
('CSFSJ-25', 'Moderna', 'Tercera dosis', 551, 'Calle Santa Julia 2309', 'CESFAM'),
('CSFSJ-25', 'Sinovac', 'Tercera dosis', 551, 'Calle Santa Julia 2309', 'CESFAM'),
('CSFSV-19', 'BCG', 'Dosis Unica', 153, 'Calle Brasil 360', 'CESFAM'),
('CSFSV-19', 'dTpa', 'Dosis Unica', 153, 'Calle Brasil 360', 'CESFAM'),
('CSFSV-19', 'Fluarix Tetra', 'Dosis Unica', 153, 'Calle Brasil 360', 'CESFAM'),
('CSFSV-19', 'Gardasil', 'Dosis Unica', 153, 'Calle Brasil 360', 'CESFAM'),
('CSFSV-19', 'Tresvírica', 'Dosis Unica', 153, 'Calle Brasil 360', 'CESFAM'),
('CSFT-10', 'Twinrix', 'Dosis Unica', 136, 'Calle Uno 10021', 'CESFAM'),
('CSFT-14', 'Pfizer', 'Segunda dosis', 450, 'Calle Juan de Dios Rivera 1060', 'CESFAM'),
('CSFT-19', 'Tresvírica', 'Dosis Unica', 125, 'Calle Fundición Norte 127', 'CESFAM'),
('CSFT-19', 'Twinrix', 'Dosis Unica', 125, 'Calle Fundición Norte 127', 'CESFAM'),
('CSFV-17', 'Fluarix Tetra', 'Dosis Unica', 88, 'Calle Indiana 1195', 'CESFAM'),
('CSFV-17', 'Gardasil', 'Dosis Unica', 88, 'Calle Indiana 1195', 'CESFAM'),
('CSFVH-12', 'Astrazeneca', 'Primera dosis', 899, 'Calle Parroquia Nuestra Señora', 'CESFAM'),
('CSFVH-12', 'Moderna', 'Primera dosis', 899, 'Calle Parroquia Nuestra Señora', 'CESFAM'),
('CSFVH-12', 'Sinovac', 'Tercera dosis', 504, 'Calle Los Pinos 275', 'CESFAM'),
('CSFVP-18', 'BCG', 'Dosis Unica', 80, 'Calle Francisco Ramírez 150', 'CESFAM'),
('CSFVP-18', 'dTpa', 'Dosis Unica', 80, 'Calle Francisco Ramírez 150', 'CESFAM'),
('CSFVP-18', 'Fluarix Tetra', 'Dosis Unica', 80, 'Calle Francisco Ramírez 150', 'CESFAM'),
('CSFVP-18', 'Gardasil', 'Dosis Unica', 80, 'Calle Francisco Ramírez 150', 'CESFAM'),
('CSFVP-18', 'tOPV', 'Dosis Unica', 80, 'Calle Francisco Ramírez 150', 'CESFAM'),
('CSMJ-13', 'Sinovac', 'Primera dosis', 500, 'Calle Gamero 849', 'Consultorio'),
('CVSESA-13', 'tOPV', 'Dosis Unica', 110, 'Calle Cochrane, Piso 2 255', 'CESFAM'),
('CVSESA-13', 'Tresvírica', 'Dosis Unica', 110, 'Calle Cochrane, Piso 2 255', 'CESFAM'),
('CVSESA-13', 'Twinrix', 'Dosis Unica', 110, 'Calle Cochrane, Piso 2 255', 'CESFAM'),
('HCGPTL-12', 'BCG', 'Dosis Unica', 109, 'Calle Caupolicán 198', 'Hospital'),
('HCGPTL-12', 'Fluarix Tetra', 'Dosis Unica', 109, 'Calle Caupolicán 198', 'Hospital'),
('HCGPTL-12', 'Gardasil', 'Dosis Unica', 109, 'Calle Caupolicán 198', 'Hospital'),
('HCSA-63', 'dTpa', 'Dosis Unica', 84, 'Avenida Chorrillos 689', 'Hospital'),
('HCSA-63', 'Fluarix Tetra', 'Dosis Unica', 84, 'Avenida Chorrillos 689', 'Hospital'),
('HCSA-63', 'Gardasil', 'Dosis Unica', 84, 'Avenida Chorrillos 689', 'Hospital'),
('HCSA-63', 'tOPV', 'Dosis Unica', 84, 'Avenida Chorrillos 689', 'Hospital'),
('HSJCC-17', 'Astrazeneca', 'Segunda dosis', 559, 'Calle Los Carrera 1320', 'Hospital'),
('PMB-17', 'Astrazeneca', 'Segunda dosis', 764, 'Avenida OHiggins 1964', 'Policlínico'),
('PMB-17', 'Pfizer', 'Segunda dosis', 764, 'Avenida OHiggins 1964', 'Policlínico'),
('PMB-17', 'Sinovac', 'Segunda dosis', 764, 'Avenida OHiggins 1964', 'Policlínico'),
('PNI-10', 'Moderna', 'Primera dosis', 825, 'Pasaje Isaza 1055', 'Policlínico'),
('PNI-10', 'Sinovac', 'Primera dosis', 825, 'Pasaje Isaza 1055', 'Policlínico'),
('VAH-10', 'BCG', 'Dosis Unica', 156, 'Calle Balmaceda 1015', 'Vacunatorio'),
('VBS-16', 'Moderna', 'Segunda dosis', 751, 'Calle Valdivia 300', 'Vacunatorio'),
('VBS-16', 'Pfizer', 'Segunda dosis', 751, 'Calle Valdivia 300', 'Vacunatorio'),
('VBS-16', 'Sinovac', 'Segunda dosis', 751, 'Calle Valdivia 300', 'Vacunatorio'),
('VC-13', 'Astrazeneca', 'Primera dosis', 559, 'Calle Futuro Paseo Peatonal 41', 'Vacunatorio'),
('VC-19', 'Moderna', 'Primera dosis', 409, 'Calle 5 Norte 901', 'Vacunatorio'),
('VC-19', 'Sinovac', 'Primera dosis', 409, 'Calle 5 Norte 901', 'Vacunatorio'),
('VHN-15', 'BCG', 'Dosis Unica', 114, 'Avenida Concha y Toro 648', 'Vacunatorio'),
('VHN-15', 'Fluarix Tetra', 'Dosis Unica', 114, 'Avenida Concha y Toro 648', 'Vacunatorio'),
('VHN-15', 'Gardasil', 'Dosis Unica', 114, 'Avenida Concha y Toro 648', 'Vacunatorio'),
('VI-11', 'Pfizer', 'Tercera dosis', 851, 'Calle Salas, Piso 3 548', 'Vacunatorio'),
('VISSM-14', 'Pfizer', 'Primera dosis', 526, 'Calle José Miguel Infante 551', 'Vacunatorio'),
('VLS-10', 'Tresvírica', 'Dosis Unica', 180, 'Calle Balmaceda 1015', 'Vacunatorio'),
('VLS-10', 'Twinrix', 'Dosis Unica', 180, 'Calle Balmaceda 1015', 'Vacunatorio'),
('VM-13', 'dTpa', 'Dosis Unica', 147, 'Calle Collypi 126', 'Vacunatorio'),
('VM-19', 'Moderna', 'Tercera dosis', 565, 'Calle Galleguillos Lorca, sala', 'Vacunatorio'),
('VNP-13', 'Gardasil', 'Dosis Unica', 111, 'Calle Yungay 475', 'Vacunatorio'),
('VSCMCSA-20', 'dTpa', 'Dosis Unica', 163, 'Calle Cochrane 405', 'Vacunatorio'),
('VSEAEIRL-23', 'BCG', 'Dosis Unica', 84, 'Avenida Chorrillos 689', 'Hospital'),
('VSEAEIRL-23', 'Tresvírica', 'Dosis Unica', 84, 'Avenida Chorrillos 689', 'Hospital'),
('VSPDA-21', 'Pfizer', 'Primera dosis', 900, 'Calle Cobija, Oficina 302 2191', 'Vacunatorio'),
('VV-14', 'BCG', 'Dosis Unica', 183, 'Avenida Arturo Prat 1170', 'Vacunatorio'),
('VV-14', 'Fluarix Tetra', 'Dosis Unica', 183, 'Avenida Arturo Prat 1170', 'Vacunatorio'),
('VV-14', 'Gardasil', 'Dosis Unica', 183, 'Avenida Arturo Prat 1170', 'Vacunatorio');

-- --------------------------------------------------------

--
-- Table structure for table `SE_DIAGNOSTICA_A_TRAVES_DE`
--

CREATE TABLE `SE_DIAGNOSTICA_A_TRAVES_DE` (
  `Rut_P` varchar(20) NOT NULL,
  `ID_P` varchar(20) NOT NULL,
  `ID_D` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SE_DIAGNOSTICA_A_TRAVES_DE`
--

INSERT INTO `SE_DIAGNOSTICA_A_TRAVES_DE` (`Rut_P`, `ID_P`, `ID_D`) VALUES
('10262238-3', 'BCX-25', 'NA-000'),
('10052126-1', 'CMS-61', 'NA-000'),
('21627706-6', 'CTI-83', 'NA-000'),
('24763335-9', 'FFB-25', 'NA-000'),
('12798713-0', 'GAK-65', 'NA-000'),
('28933390-8', 'GTD-36', 'NA-000'),
('20869275-5', 'HFC-82', 'NA-000'),
('9051543-8', 'HRC-85', 'NA-000'),
('25805069-K', 'HVQ-89', 'NA-000'),
('25207322-1', 'HVV-43', 'NA-000'),
('13897465-0', 'HWJ-52', 'NA-000'),
('24564009-9', 'IBD-87', 'NA-000'),
('21902423-1', 'JVY-54', 'NA-000'),
('9021477-2', 'JYO-81', 'NA-000'),
('14097237-1', 'KHR-46', 'NA-000'),
('27857575-6', 'KIL-36', 'NA-000'),
('11756388-K', 'MST-73', 'NA-000'),
('26601705-7', 'MYI-99', 'NA-000'),
('10907183-8', 'NAH-00', 'ZC-593'),
('11330175-9', 'NAH-00', 'MP-939'),
('11660445-0', 'NAH-00', 'UA-587'),
('12582458-7', 'NAH-00', 'ZF-354'),
('15926482-3', 'NAH-00', 'SL-450'),
('15944732-4', 'NAH-00', 'SB-550'),
('17598833-5', 'NAH-00', 'LO-857'),
('18227955-2', 'NAH-00', 'QI-407'),
('18328729-k', 'NAH-00', 'TL-762'),
('19091042-3', 'NAH-00', 'WK-197'),
('19324587-0', 'NAH-00', 'VP-837'),
('19417683-K', 'NAH-00', 'ZW-500'),
('19936126-0', 'NAH-00', 'CA-674'),
('21216938-2', 'NAH-00', 'WS-503'),
('22569634-9', 'NAH-00', 'GC-468'),
('23200250-6', 'NAH-00', 'YX-589'),
('23417084-8', 'NAH-00', 'ZR-829'),
('24867555-1', 'NAH-00', 'YC-952'),
('26346325-0', 'NAH-00', 'GD-758'),
('26518668-8', 'NAH-00', 'CQ-493'),
('27054564-5', 'NAH-00', 'XV-269'),
('27230281-2', 'NAH-00', 'VG-180'),
('27623695-4', 'NAH-00', 'UL-923'),
('27808819-7', 'NAH-00', 'KC-479'),
('28723270-5', 'NAH-00', 'UQ-971'),
('6992106-k', 'NAH-00', 'AQ-248'),
('7719667-6', 'NAH-00', 'LZ-351'),
('8091091-6', 'NAH-00', 'QH-617'),
('8472487-4', 'NAH-00', 'HG-234'),
('8824295-5', 'NAH-00', 'KZ-915'),
('8955283-4', 'NAH-00', 'UY-288'),
('9274767-0', 'NAH-00', 'RR-631'),
('9715876-2', 'NAH-00', 'GZ-148'),
('15668430-9', 'NRK-51', 'NA-000'),
('22131415-8', 'OAL-72', 'NA-000'),
('23413945-2', 'OGZ-73', 'NA-000'),
('25501606-7', 'OIS-83', 'NA-000'),
('29493406-5', 'OTI-31', 'NA-000'),
('27015464-6', 'OTX-69', 'NA-000'),
('8616345-4', 'PGM-41', 'NA-000'),
('14493757-0', 'PLD-21', 'NA-000'),
('24153354-9', 'QMY-34', 'NA-000'),
('25060792-K', 'QOR-21', 'NA-000'),
('13910986-4', 'QYV-25', 'NA-000'),
('20338726-1', 'RAX-80', 'NA-000'),
('12254594-6', 'TNI-30', 'NA-000'),
('24106579-0', 'TST-52', 'NA-000'),
('16968985-7', 'TUD-80', 'NA-000'),
('12732725-4', 'TUV-49', 'NA-000'),
('8663749-9', 'TVU-16', 'NA-000'),
('20293607-5', 'UIE-60', 'NA-000'),
('12242853-2', 'WGW-11', 'NA-000'),
('20599397-5', 'XMZ-19', 'NA-000'),
('12426179-1', 'XOJ-63', 'NA-000'),
('10987637-2', 'XWL-72', 'NA-000'),
('10251087-9', 'XWO-67', 'NA-000'),
('21530906-1', 'ZHN-50', 'NA-000');

-- --------------------------------------------------------

--
-- Table structure for table `SE_DISTRIBUYE_EN`
--

CREATE TABLE `SE_DISTRIBUYE_EN` (
  `Nombre_V` varchar(20) NOT NULL,
  `ID_PV` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SE_DISTRIBUYE_EN`
--

INSERT INTO `SE_DISTRIBUYE_EN` (`Nombre_V`, `ID_PV`) VALUES
('Astrazeneca', 'CCSFA-12'),
('Fluarix Tetra', 'CCSFAN-14'),
('Gardasil', 'CCSFAN-14'),
('Moderna', 'CCSFB-28'),
('Pfizer', 'CCSFB-28'),
('Astrazeneca', 'CCSFBPH-19'),
('Moderna', 'CCSFBPH-19'),
('Pfizer', 'CCSFBPH-19'),
('Sinovac', 'CCSFBPH-19'),
('Pfizer', 'CCSFCP-17'),
('BCG', 'CCSFDI-12'),
('Tresvírica', 'CCSFDI-12'),
('Twinrix', 'CCSFDI-12'),
('tOPV', 'CCSFEC-57'),
('Twinrix', 'CCSFEC-57'),
('Astrazeneca', 'CCSFG-14'),
('Moderna', 'CCSFG-14'),
('Sinovac', 'CCSFG-14'),
('dTpa', 'CCSFIN-12'),
('tOPV', 'CCSFIN-12'),
('Tresvírica', 'CCSFIN-12'),
('Twinrix', 'CCSFIN-12'),
('BCG', 'CCSFSG-81'),
('dTpa', 'CCSFSG-81'),
('Fluarix Tetra', 'CCSFSG-81'),
('Gardasil', 'CCSFSG-81'),
('tOPV', 'CCSFSG-81'),
('Astrazeneca', 'CCSFSL-17'),
('Sinovac', 'CCSFSL-17'),
('dTpa', 'CCSFSPM-15'),
('Fluarix Tetra', 'CCSFSPM-15'),
('tOPV', 'CCSFSPM-15'),
('Tresvírica', 'CCSFSPM-15'),
('Twinrix', 'CCSFSPM-15'),
('dTpa', 'CCSFT-17'),
('tOPV', 'CCSFT-17'),
('Twinrix', 'CCSFT-17'),
('Astrazeneca', 'CCSFVC-11'),
('Tresvírica', 'CCSFVH-13'),
('Moderna', 'CCSFY-17'),
('Sinovac', 'CMDCAPREDENA-15'),
('Sinovac', 'CMDM-18'),
('Astrazeneca', 'CMM-28'),
('Moderna', 'CMM-28'),
('Sinovac', 'CMM-28'),
('BCG', 'CMMPM-12'),
('Tresvírica', 'CMMPM-12'),
('Tresvírica', 'CPEL-90'),
('Twinrix', 'CPEL-90'),
('Twinrix', 'CSCEDIMED-13'),
('tOPV', 'CSFA-12'),
('Twinrix', 'CSFA-12'),
('BCG', 'CSFA-13'),
('tOPV', 'CSFA-19'),
('Astrazeneca', 'CSFA-20'),
('Sinovac', 'CSFA-20'),
('Astrazeneca', 'CSFA-62'),
('Moderna', 'CSFA-62'),
('Pfizer', 'CSFA-62'),
('Sinovac', 'CSFA-62'),
('dTpa', 'CSFB-65'),
('Fluarix Tetra', 'CSFB-65'),
('Gardasil', 'CSFB-65'),
('tOPV', 'CSFB-65'),
('Twinrix', 'CSFB-65'),
('Pfizer', 'CSFBL-11'),
('Astrazeneca', 'CSFBL-19'),
('Sinovac', 'CSFBZ-14'),
('Fluarix Tetra', 'CSFC-14'),
('Moderna', 'CSFCB-96'),
('Pfizer', 'CSFCB-96'),
('Sinovac', 'CSFCB-96'),
('dTpa', 'CSFCC-17'),
('Fluarix Tetra', 'CSFCC-17'),
('tOPV', 'CSFCC-17'),
('Twinrix', 'CSFCC-17'),
('Astrazeneca', 'CSFCC-54'),
('Pfizer', 'CSFCC-54'),
('Sinovac', 'CSFCC-54'),
('Moderna', 'CSFDAA-10'),
('Sinovac', 'CSFDAA-10'),
('BCG', 'CSFDFM-72'),
('Fluarix Tetra', 'CSFDFM-72'),
('Gardasil', 'CSFDFM-72'),
('Tresvírica', 'CSFDFM-72'),
('dTpa', 'CSFDLF-56'),
('tOPV', 'CSFDLF-56'),
('Tresvírica', 'CSFDLF-56'),
('Twinrix', 'CSFDLF-56'),
('Moderna', 'CSFEFM-17'),
('Sinovac', 'CSFEM-10'),
('Astrazeneca', 'CSFER-10'),
('Pfizer', 'CSFER-10'),
('Sinovac', 'CSFER-10'),
('BCG', 'CSFES-89'),
('Fluarix Tetra', 'CSFES-89'),
('Gardasil', 'CSFES-89'),
('tOPV', 'CSFES-89'),
('Astrazeneca', 'CSFEV-10'),
('BCG', 'CSFG-10'),
('Gardasil', 'CSFG-10'),
('Tresvírica', 'CSFG-10'),
('Moderna', 'CSFGS-11'),
('Pfizer', 'CSFGS-11'),
('Sinovac', 'CSFGS-11'),
('Moderna', 'CSFIFC-14'),
('Pfizer', 'CSFIFC-14'),
('tOPV', 'CSFJA-11'),
('dTpa', 'CSFJPII-32'),
('Fluarix Tetra', 'CSFJPII-32'),
('Gardasil', 'CSFJPII-32'),
('tOPV', 'CSFJPII-32'),
('dTpa', 'CSFL-15'),
('Astrazeneca', 'CSFLA-27'),
('Moderna', 'CSFLA-27'),
('Pfizer', 'CSFLA-27'),
('Moderna', 'CSFLB-16'),
('BCG', 'CSFLQ-11'),
('Tresvírica', 'CSFLQ-11'),
('Moderna', 'CSFN-19'),
('Pfizer', 'CSFNSIC-18'),
('BCG', 'CSFO-14'),
('Gardasil', 'CSFO-14'),
('tOPV', 'CSFPA-13'),
('Tresvírica', 'CSFPA-13'),
('Twinrix', 'CSFPA-13'),
('dTpa', 'CSFPLG-12'),
('tOPV', 'CSFPLG-12'),
('Twinrix', 'CSFPLG-12'),
('Twinrix', 'CSFQB-20'),
('Moderna', 'CSFR-17'),
('Pfizer', 'CSFR-18'),
('BCG', 'CSFSA-80'),
('Fluarix Tetra', 'CSFSA-80'),
('Gardasil', 'CSFSA-80'),
('Tresvírica', 'CSFSA-80'),
('dTpa', 'CSFSJ-13'),
('Moderna', 'CSFSJ-25'),
('Sinovac', 'CSFSJ-25'),
('BCG', 'CSFSV-19'),
('dTpa', 'CSFSV-19'),
('Fluarix Tetra', 'CSFSV-19'),
('Gardasil', 'CSFSV-19'),
('Tresvírica', 'CSFSV-19'),
('Twinrix', 'CSFT-10'),
('Pfizer', 'CSFT-14'),
('Tresvírica', 'CSFT-19'),
('Twinrix', 'CSFT-19'),
('Fluarix Tetra', 'CSFV-17'),
('Gardasil', 'CSFV-17'),
('Astrazeneca', 'CSFVH-12'),
('Moderna', 'CSFVH-12'),
('Sinovac', 'CSFVH-12'),
('BCG', 'CSFVP-18'),
('dTpa', 'CSFVP-18'),
('Fluarix Tetra', 'CSFVP-18'),
('Gardasil', 'CSFVP-18'),
('tOPV', 'CSFVP-18'),
('Sinovac', 'CSMJ-13'),
('tOPV', 'CVSESA-13'),
('Tresvírica', 'CVSESA-13'),
('Twinrix', 'CVSESA-13'),
('BCG', 'HCGPTL-12'),
('Fluarix Tetra', 'HCGPTL-12'),
('Gardasil', 'HCGPTL-12'),
('dTpa', 'HCSA-63'),
('Fluarix Tetra', 'HCSA-63'),
('Gardasil', 'HCSA-63'),
('tOPV', 'HCSA-63'),
('Astrazeneca', 'HSJCC-17'),
('Astrazeneca', 'PMB-17'),
('Pfizer', 'PMB-17'),
('Sinovac', 'PMB-17'),
('Moderna', 'PNI-10'),
('Sinovac', 'PNI-10'),
('BCG', 'VAH-10'),
('Moderna', 'VBS-16'),
('Pfizer', 'VBS-16'),
('Sinovac', 'VBS-16'),
('Astrazeneca', 'VC-13'),
('Moderna', 'VC-19'),
('Sinovac', 'VC-19'),
('BCG', 'VHN-15'),
('Fluarix Tetra', 'VHN-15'),
('Gardasil', 'VHN-15'),
('Pfizer', 'VI-11'),
('Pfizer', 'VISSM-14'),
('Tresvírica', 'VLS-10'),
('Twinrix', 'VLS-10'),
('dTpa', 'VM-13'),
('Moderna', 'VM-19'),
('Gardasil', 'VNP-13'),
('dTpa', 'VSCMCSA-20'),
('BCG', 'VSEAEIRL-23'),
('Tresvírica', 'VSEAEIRL-23'),
('Pfizer', 'VSPDA-21'),
('BCG', 'VV-14'),
('Fluarix Tetra', 'VV-14'),
('Gardasil', 'VV-14');

-- --------------------------------------------------------

--
-- Table structure for table `SE_EVITA_POR`
--

CREATE TABLE `SE_EVITA_POR` (
  `Nombre_E` varchar(20) NOT NULL,
  `Nombre_V` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SE_EVITA_POR`
--

INSERT INTO `SE_EVITA_POR` (`Nombre_E`, `Nombre_V`) VALUES
('COVID-19', 'Astrazeneca'),
('Tuberculosis', 'BCG'),
('Tétanos', 'dTpa'),
('Influenza', 'Fluarix Tetra'),
('Virus papiloma human', 'Gardasil'),
('COVID-19', 'Moderna'),
('COVID-19', 'Pfizer'),
('COVID-19', 'Sinovac'),
('Poliomielitis', 'tOPV'),
('Sarampión', 'Tresvírica'),
('Hepatitis B', 'Twinrix');

-- --------------------------------------------------------

--
-- Table structure for table `SE_INOCULA`
--

CREATE TABLE `SE_INOCULA` (
  `ID_PV` varchar(20) NOT NULL,
  `Rut_P` varchar(20) NOT NULL,
  `Vacuna` text,
  `Dosis` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SE_INOCULA`
--

INSERT INTO `SE_INOCULA` (`ID_PV`, `Rut_P`, `Vacuna`, `Dosis`) VALUES
('CCSFA-12', '29493406-5', 'Astrazeneca', '1ra'),
('CCSFAN-14', '11722171-7', 'Gardasil', 'Dos'),
('CCSFAN-14', '24867555-1', 'Gardasil', 'Dos'),
('CCSFBPH-19', '19091042-3', 'Pfizer', '1ra'),
('CCSFCP-17', '24599998-4', 'Pfizer', '2da'),
('CCSFCP-17', '27857575-6', 'Pfizer', '2da'),
('CCSFDI-12', '12242853-2', 'Tresvírica', 'Dos'),
('CCSFDI-12', '5132016-6', 'Tresvírica', 'Dos'),
('CCSFEC-57', '12582458-7', 'Twinrix', 'Dos'),
('CCSFG-14', '12426179-1', 'Moderna', '2da'),
('CCSFIN-12', '21904218-3', 'Tresvírica', 'Dos'),
('CCSFSG-81', '14954220-5', 'Gardasil', 'Dos'),
('CCSFSL-17', '12732725-4', 'Sinovac', '1ra'),
('CCSFSL-17', '22990898-7', 'Astrazeneca', '1ra'),
('CCSFSL-17', '8955283-4', 'Astrazeneca', '1ra'),
('CCSFSPM-15', '10052126-1', 'Tresvírica', 'Dos'),
('CCSFSPM-15', '9715876-2', 'dTpa', 'Dos'),
('CCSFT-17', '28723270-5', 'Twinrix', 'Dos'),
('CCSFT-17', '7719667-6', 'Twinrix', 'Dos'),
('CCSFVC-11', '12928017-4', 'Astrazeneca', '1ra'),
('CCSFVH-13', '24564009-9', 'Tresvírica', 'Dos'),
('CCSFY-17', '12254594-6', 'Moderna', '3ra'),
('CCSFY-17', '21216938-2', 'Moderna', '3ra'),
('CCSFY-17', '26601705-7', 'Moderna', '3ra'),
('CMDM-18', '23417084-8', 'Sinovac', '1ra'),
('CMM-28', '11780331-7', 'Astrazeneca', '1ra'),
('CMM-28', '20869275-5', 'Moderna', '1ra'),
('CMM-28', '22412196-2', 'Astrazeneca', '1ra'),
('CMM-28', '26518668-8', 'Astrazeneca', '1ra'),
('CMM-28', '27230281-2', 'Moderna', '1ra'),
('CMMPM-12', '22569634-9', 'BCG', 'Dos'),
('CPEL-90', '15926482-3', 'Tresvírica', 'Dos'),
('CSFA-12', '14097237-1', 'Twinrix', 'Dos'),
('CSFA-12', '8091091-6', 'tOPV', 'Dos'),
('CSFA-19', '27623695-4', 'tOPV', 'Dos'),
('CSFA-20', '17877018-7', 'Sinovac', '3ra'),
('CSFA-20', '18384004-5', 'Sinovac', '3ra'),
('CSFA-62', '10907183-8', 'Astrazeneca', '3ra'),
('CSFA-62', '8955283-4', 'Pfizer', '3ra'),
('CSFB-65', '18328729-k', 'Twinrix', 'Dos'),
('CSFB-65', '27054564-5', 'Fluarix Tetra', 'Dos'),
('CSFBL-11', '12798713-0', 'Pfizer', '2da'),
('CSFBL-11', '23417084-8', 'Pfizer', '2da'),
('CSFBL-19', '11974084-3', 'Astrazeneca', '2da'),
('CSFBZ-14', '22487788-9', 'Sinovac', '3ra'),
('CSFBZ-14', '25504779-5', 'Sinovac', '3ra'),
('CSFBZ-14', '26601705-7', 'Sinovac', '3ra'),
('CSFC-14', '14542878-5', 'Fluarix Tetra', 'Dos'),
('CSFC-14', '17598833-5', 'Fluarix Tetra', 'Dos'),
('CSFC-14', '24676044-6', 'Fluarix Tetra', 'Dos'),
('CSFCC-17', '10987637-2', 'tOPV', 'Dos'),
('CSFCC-54', '22865103-6', 'Sinovac', '3ra'),
('CSFCC-54', '27808819-7', 'Pfizer', '3ra'),
('CSFDAA-10', '11756388-K', 'Sinovac', '3ra'),
('CSFDAA-10', '20921478-4', 'Moderna', '3ra'),
('CSFDFM-72', '19324587-0', 'Tresvírica', 'Dos'),
('CSFDFM-72', '23648713-k', 'BCG', 'Dos'),
('CSFDLF-56', '19157451-6', 'tOPV', 'Dos'),
('CSFDLF-56', '19322526-8', 'dTpa', 'Dos'),
('CSFDLF-56', '6992106-k', 'Twinrix', 'Dos'),
('CSFEFM-17', '8472487-4', 'Moderna', '1ra'),
('CSFEFM-17', '8616345-4', 'Moderna', '1ra'),
('CSFEM-10', '10251087-9', 'Sinovac', '2da'),
('CSFEM-10', '15000339-3', 'Sinovac', '2da'),
('CSFEM-10', '8429270-2', 'Sinovac', '2da'),
('CSFER-10', '15944732-4', 'Sinovac', '3ra'),
('CSFES-89', '15759828-7', 'Gardasil', 'Dos'),
('CSFES-89', '20338726-1', 'Fluarix Tetra', 'Dos'),
('CSFES-89', '21530906-1', 'Gardasil', 'Dos'),
('CSFES-89', '22569634-9', 'Fluarix Tetra', 'Dos'),
('CSFES-89', '24106579-0', 'Fluarix Tetra', 'Dos'),
('CSFG-10', '13910986-4', 'BCG', 'Dos'),
('CSFGS-11', '10262238-3', 'Sinovac', '2da'),
('CSFGS-11', '29425276-2', 'Pfizer', '2da'),
('CSFGS-11', '29493406-5', 'Moderna', '2da'),
('CSFGS-11', '6992106-k', 'Sinovac', '2da'),
('CSFIFC-14', '22569634-9', 'Pfizer', '2da'),
('CSFJA-11', '11330175-9', 'tOPV', 'Dos'),
('CSFJA-11', '12798713-0', 'tOPV', 'Dos'),
('CSFJA-11', '19875616-4', 'tOPV', 'Dos'),
('CSFJPII-32', '15759828-7', 'tOPV', 'Dos'),
('CSFLB-16', '16968985-7', 'Moderna', '2da'),
('CSFLQ-11', '27808819-7', 'Tresvírica', 'Dos'),
('CSFN-19', '22412196-2', 'Moderna', '2da'),
('CSFNSIC-18', '14657202-2', 'Pfizer', '3ra'),
('CSFO-14', '23417084-8', 'BCG', 'Dos'),
('CSFO-14', '8824295-5', 'Gardasil', 'Dos'),
('CSFPA-13', '10251087-9', 'Twinrix', 'Dos'),
('CSFPLG-12', '12025007-8', 'dTpa', 'Dos'),
('CSFPLG-12', '9715876-2', 'dTpa', 'Dos'),
('CSFQB-20', '13897465-0', 'Twinrix', 'Dos'),
('CSFR-17', '20020754-8', 'Moderna', '3ra'),
('CSFR-17', '21902423-1', 'Moderna', '3ra'),
('CSFR-18', '14954220-5', 'Pfizer', '1ra'),
('CSFR-18', '9051543-8', 'Pfizer', '1ra'),
('CSFSJ-13', '24676044-6', 'dTpa', 'Dos'),
('CSFSJ-25', '9274767-0', 'Moderna', '3ra'),
('CSFSV-19', '12242853-2', 'dTpa', 'Dos'),
('CSFT-10', '11330175-9', 'Twinrix', 'Dos'),
('CSFT-10', '8219337-5', 'Twinrix', 'Dos'),
('CSFT-14', '24153354-9', 'Pfizer', '2da'),
('CSFT-19', '23200250-6', 'Twinrix', 'Dos'),
('CSFT-19', '24106579-0', 'Twinrix', 'Dos'),
('CSFV-17', '12732725-4', 'Gardasil', 'Dos'),
('CSFV-17', '16688546-9', 'Fluarix Tetra', 'Dos'),
('CSFVH-12', '27230281-2', 'Pfizer', '3ra'),
('CSFVH-12', '29425276-2', 'Sinovac', '3ra'),
('CSFVP-18', '24106579-0', 'dTpa', 'Dos'),
('CSMJ-13', '24923605-5', 'Sinovac', '1ra'),
('CVSESA-13', '19157451-6', 'Twinrix', 'Dos'),
('HCGPTL-12', '19417683-K', 'Fluarix Tetra', 'Dos'),
('HCGPTL-12', '24867555-1', 'Gardasil', 'Dos'),
('HCGPTL-12', '28723270-5', 'Fluarix Tetra', 'Dos'),
('HSJCC-17', '22311328-1', 'Astrazeneca', '2da'),
('PNI-10', '17732337-3', 'Moderna', '1ra'),
('PNI-10', '20921478-4', 'Moderna', '1ra'),
('PNI-10', '20948019-0', 'Moderna', '1ra'),
('PNI-10', '28933390-8', 'Sinovac', '1ra'),
('VAH-10', '12798713-0', 'BCG', 'Dos'),
('VAH-10', '14493757-0', 'BCG', 'Dos'),
('VBS-16', '19157451-6', 'Pfizer', '2da'),
('VBS-16', '8824295-5', 'Sinovac', '2da'),
('VC-19', '25207322-1', 'Sinovac', '1ra'),
('VHN-15', '14542878-5', 'Gardasil', 'Dos'),
('VHN-15', '24564009-9', 'Fluarix Tetra', 'Dos'),
('VHN-15', '27623695-4', 'Fluarix Tetra', 'Dos'),
('VISSM-14', '14657202-2', 'Pfizer', '1ra'),
('VISSM-14', '24564009-9', 'Pfizer', '1ra'),
('VLS-10', '11974084-3', 'Tresvírica', 'Dos'),
('VLS-10', '22990898-7', 'Twinrix', 'Dos'),
('VLS-10', '25060792-K', 'Twinrix', 'Dos'),
('VM-19', '23648713-k', 'Moderna', '3ra'),
('VSCMCSA-20', '21627706-6', 'dTpa', 'Dos'),
('VSCMCSA-20', '25805069-K', 'dTpa', 'Dos'),
('VSCMCSA-20', '26601705-7', 'dTpa', 'Dos'),
('VSPDA-21', '20599397-5', 'Pfizer', '1ra'),
('VV-14', '18227955-2', 'Fluarix Tetra', 'Dos'),
('VV-14', '27015464-6', 'BCG', 'Dos');

-- --------------------------------------------------------

--
-- Table structure for table `SINTOMA`
--

CREATE TABLE `SINTOMA` (
  `Rut_P` varchar(20) NOT NULL,
  `Sintoma` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SINTOMA`
--

INSERT INTO `SINTOMA` (`Rut_P`, `Sintoma`) VALUES
('10052126-1', 'Llagas dolorosas en '),
('10251087-9', 'Aparición de verruga'),
('10262238-3', 'Aparición de verruga'),
('10987637-2', 'Tos'),
('11625991-5', 'Fatiga'),
('11722171-7', 'Ojos enrojecidos y l'),
('11756388-K', 'Aparición de verruga'),
('12025007-8', 'Erupción'),
('12254594-6', 'Parálisis flácida'),
('12732725-4', 'Fiebre'),
('12798713-0', 'Dolor abdominal'),
('13897465-0', 'Espasmos musculares '),
('14097237-1', 'Aparición de verruga'),
('14493757-0', 'Parálisis flácida'),
('14657202-2', 'Aparición de verruga'),
('14954220-5', 'Dolor de pecho'),
('15000339-3', 'Cansancio'),
('15759828-7', 'Pérdida del gusto o '),
('16688546-9', 'Cansancio'),
('16968985-7', 'Fiere'),
('17254609-9', 'Orina oscura'),
('17732337-3', 'Fiebre'),
('18227955-2', 'Color amarillento en'),
('18328729-k', 'Fiebre'),
('18384004-5', 'Fiebre'),
('19091042-3', 'Fiebre'),
('19157451-6', 'Ganglios linfáticos '),
('19322526-8', 'Tos'),
('19324587-0', 'Aparición de verruga'),
('19875616-4', 'Tos'),
('20020754-8', 'Dolores musculares i'),
('20293607-5', 'Vómitos'),
('20921478-4', 'Fiebre'),
('21530906-1', 'Parálisis flácida'),
('21902423-1', 'Pérdida del gusto o '),
('21904218-3', 'Aparición de verruga'),
('22311328-1', 'Congestión nasal'),
('22487788-9', 'Pérdida de reflejos'),
('22569634-9', 'Fiebre'),
('22865103-6', 'Congestión nasal'),
('23200250-6', 'Pérdida del apetito'),
('23404776-0', 'Espasmos musculares '),
('23413945-2', 'Dolor de pecho'),
('24106579-0', 'Dolor de cabeza'),
('24564009-9', 'Dolor de pecho'),
('24676044-6', 'Color amarillento en'),
('24763335-9', 'Tos'),
('24923605-5', 'Aparición de verruga'),
('25207322-1', 'Aparición de verruga'),
('25501606-7', 'Vómitos'),
('26601705-7', 'Aparición de verruga'),
('27015464-6', 'Pérdida del gusto o '),
('27623695-4', 'Fiebre'),
('27808819-7', 'Fiebre'),
('28723270-5', 'Fiebre'),
('28933390-8', 'Dolor de pecho'),
('29493406-5', 'Dolor de pecho'),
('5132016-6', 'Parálisis flácida'),
('6043274-0', 'Pérdida de peso'),
('7719667-6', 'Músculos abdominales'),
('8091091-6', 'Tos'),
('8219337-5', 'Debilidad'),
('8429270-2', 'Ojos enrojecidos y l'),
('8472487-4', 'Dolor de pecho'),
('8663749-9', 'Aparición de verruga'),
('8824295-5', 'Diarrea'),
('9021477-2', 'Tos'),
('9645958-0', 'Fiebre'),
('9715876-2', 'Moqueo');

-- --------------------------------------------------------

--
-- Table structure for table `TRABAJA`
--

CREATE TABLE `TRABAJA` (
  `ID_PV` varchar(20) NOT NULL,
  `Nombre_V` varchar(20) NOT NULL,
  `ID_CS` varchar(20) NOT NULL,
  `RUT_PM` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TRABAJA`
--

INSERT INTO `TRABAJA` (`ID_PV`, `Nombre_V`, `ID_CS`, `RUT_PM`) VALUES
('CSFA-13', 'BCG', 'CA-56', '8320358-7'),
('CSFJPII-32', 'Fluarix Tetra', 'CA-56', '13150878-6'),
('CCSFSL-17', 'Astrazeneca', 'CALD-10', '18134308-7'),
('CCSFB-28', 'Pfizer', 'CAO-17', '10121668-3'),
('CSFDAA-10', 'Sinovac', 'CAO-17', '22014791-6'),
('VM-13', 'dTpa', 'CAO-17', '23934907-2'),
('CCSFY-17', 'Moderna', 'CASA-81', '19563995-7'),
('CSFBL-19', 'Astrazeneca', 'CAT-61', '14561008-7'),
('VAH-10', 'BCG', 'CAT-61', '20578549-3'),
('CSFA-19', 'tOPV', 'CAV-71', '10063049-4'),
('VSCMCSA-20', 'dTpa', 'CAV-71', '21434350-9'),
('VV-14', 'Fluarix Tetra', 'CAV-71', '21434350-9'),
('CSFEM-10', 'Sinovac', 'CB-15', '9010781-k'),
('CCSFA-12', 'Astrazeneca', 'CC-33', '7815972-3'),
('CMDCAPREDENA-15', 'Sinovac', 'CCMA-64', '14561959-9'),
('CCSFCP-17', 'Pfizer', 'CCSB-28', '20180166-4'),
('CCSFA-12', 'Astrazeneca', 'CCSFA-81', '22413078-3'),
('CSFBZ-14', 'Sinovac', 'CCSFA-81', '20699412-6'),
('CSFA-19', 'tOPV', 'CCSFDCS-58', '10682905-5'),
('CSFVH-12', 'Pfizer', 'CCSFDCS-58', '29799984-2'),
('CSFSV-19', 'dTpa', 'CCSFE-56', '15702947-9'),
('CVSESA-13', 'Twinrix', 'CCSFE-56', '20699412-6'),
('HCGPTL-12', 'Fluarix Tetra', 'CCSFE-56', '16656058-6'),
('CSFO-14', 'Gardasil', 'CCSFEA-28', '9058099-k'),
('CSFV-17', 'Gardasil', 'CCSFEA-28', '15879832-8'),
('CCSFCP-17', 'Pfizer', 'CCSFEP-57', '19908395-3'),
('CMMPM-12', 'BCG', 'CCSFEP-57', '20996010-9'),
('CSFT-14', 'Pfizer', 'CCSFEP-57', '17229934-2'),
('CMMPM-12', 'BCG', 'CCSFL-40', '10821584-4'),
('CSFCB-96', 'Pfizer', 'CCSFLLUVN-11', '14170847-3'),
('CSFPLG-12', 'Twinrix', 'CCSFM-28', '21412864-0'),
('CSFT-14', 'Pfizer', 'CCSFM-28', '20180166-4'),
('VI-11', 'Pfizer', 'CCSFM-28', '8337998-7'),
('CCSFCP-17', 'Pfizer', 'CDV-43', '17382983-3'),
('CCSFVH-13', 'Tresvírica', 'CDV-43', '15702947-9'),
('CMM-28', 'Astrazeneca', 'CDV-43', '12734953-3'),
('CSFA-62', 'Astrazeneca', 'CDV-43', '19599581-8'),
('CSFC-14', 'Fluarix Tetra', 'CF-14', '13374197-6'),
('CSFCC-54', 'Pfizer', 'CF-14', '22014791-6'),
('CSFC-14', 'Fluarix Tetra', 'CI-14', '13596575-8'),
('CSFR-18', 'Pfizer', 'CI-14', '5074050-1'),
('CSFN-19', 'Moderna', 'CIMM-33', '15879832-8'),
('VAH-10', 'BCG', 'CIMM-33', '13150878-6'),
('CSFA-62', 'Pfizer', 'CIR-19', '23357690-5'),
('CSFNSIC-18', 'Pfizer', 'CIR-19', '5711662-5'),
('CSFC-14', 'Fluarix Tetra', 'CISM-38', '10682905-5'),
('CSFDAA-10', 'Sinovac', 'CISM-38', '27860788-7'),
('CSFV-17', 'Gardasil', 'CISM-38', '17229934-2'),
('CSFVH-12', 'Sinovac', 'CISM-38', '20923739-3'),
('HSJCC-17', 'Astrazeneca', 'CISM-38', '12202561-6'),
('HCGPTL-12', 'BCG', 'CIT-38', '13576291-1'),
('CCSFCP-17', 'Pfizer', 'CLA-56', '9449197-5'),
('CSFC-14', 'Fluarix Tetra', 'CLA-56', '13374197-6'),
('CSFR-17', 'Moderna', 'CLA-56', '11788466-k'),
('CMM-28', 'Moderna', 'CLC-42', '9369750-2'),
('CSFVP-18', 'Fluarix Tetra', 'CLL-21', '16656058-6'),
('HSJCC-17', 'Astrazeneca', 'CLL-21', '22602198-1'),
('CSFDLF-56', 'tOPV', 'CLL-58', '19973787-2'),
('PMB-17', 'Sinovac', 'CLL-58', '25653519-K'),
('VISSM-14', 'Pfizer', 'CLL-58', '20180166-4'),
('CCSFG-14', 'Sinovac', 'CM-14', '13150878-6'),
('HCGPTL-12', 'Gardasil', 'CM-24', '15936457-7'),
('CSFCC-54', 'Astrazeneca', 'CMCENTROMED-35', '25236077-8'),
('VM-13', 'dTpa', 'CMCENTROMED-35', '16656058-6'),
('CCSFBPH-19', 'Astrazeneca', 'CMCHP-66', '20699412-6'),
('CSFN-19', 'Moderna', 'CMCSMLD-19', '12734953-3'),
('CCSFCP-17', 'Pfizer', 'CMILS-10', '10063049-4'),
('CCSFSG-81', 'Fluarix Tetra', 'CMILS-10', '17268552-8'),
('CSFGS-11', 'Moderna', 'CMILS-10', '21775840-8'),
('CSFBZ-14', 'Sinovac', 'CMK-31', '25653519-K'),
('CSFES-89', 'Gardasil', 'CMK-31', '10821584-4'),
('CCSFBPH-19', 'Pfizer', 'CMOCS-45', '22453577-5'),
('CMDCAPREDENA-15', 'Sinovac', 'CMS-16', '8917057-5'),
('CSFDLF-56', 'tOPV', 'CMS-16', '26128891-5'),
('PNI-10', 'Sinovac', 'CMVIA-18', '21852320-K'),
('CSCEDIMED-13', 'Twinrix', 'CMVIT-16', '20751066-1'),
('CSFPA-13', 'Tresvírica', 'CPM-49', '22640700-6'),
('CCSFT-17', 'dTpa', 'CPM-72', '25236077-8'),
('CSFCC-17', 'dTpa', 'CPM-72', '13576291-1'),
('VM-19', 'Moderna', 'CPM-72', '29799984-2'),
('CSFCC-54', 'Sinovac', 'CPS-66', '26588880-1'),
('CSFES-89', 'tOPV', 'CPS-66', '19729624-0'),
('PNI-10', 'Moderna', 'CPS-66', '22602198-1'),
('CSFA-12', 'tOPV', 'CRE-18', '13275126-9'),
('CSFA-62', 'Astrazeneca', 'CSA-42', '8320358-7'),
('CSFCC-54', 'Pfizer', 'CSA-42', '28169636-K'),
('VSPDA-21', 'Pfizer', 'CSAC-27', '13393402-2'),
('CSFEM-10', 'Sinovac', 'CSCA-11', '9058099-k'),
('CCSFIN-12', 'tOPV', 'CSFAREC-62', '14170847-3'),
('CMDCAPREDENA-15', 'Sinovac', 'CSFAREC-62', '18357190-7'),
('CCSFSL-17', 'Astrazeneca', 'CSFC-43', '25236077-8'),
('CSFEM-10', 'Sinovac', 'CSFC-43', '20923739-3'),
('CSFBL-11', 'Pfizer', 'CSFCN-70', '24736254-1'),
('CSFVP-18', 'BCG', 'CSFDAS-11', '21412864-0'),
('CCSFSG-81', 'BCG', 'CSFDMS-13', '22371206-1'),
('VSPDA-21', 'Pfizer', 'CSFDMS-13', '15355322-k'),
('CMMPM-12', 'BCG', 'CSFEQ-21', '7564310-1'),
('CSFCB-96', 'Pfizer', 'CSFEQ-21', '24659275-6'),
('CSFNSIC-18', 'Pfizer', 'CSFEQ-21', '24520659-3'),
('CSFDFM-72', 'Gardasil', 'CSFP-19', '10063049-4'),
('CCSFAN-14', 'Gardasil', 'CSFPMB-70', '22651730-8'),
('CCSFSG-81', 'Fluarix Tetra', 'CSFPMB-70', '23936414-4'),
('CCSFSG-81', 'Fluarix Tetra', 'CSFPMB-70', '26989227-7'),
('CSFA-19', 'tOPV', 'CSFPN-23', '8723169-0'),
('CSFDLF-56', 'dTpa', 'CSFPN-23', '24703825-6'),
('HCSA-63', 'Fluarix Tetra', 'CSFPN-23', '13150878-6'),
('CSFT-19', 'Tresvírica', 'CSM-87', '12550166-4'),
('VC-19', 'Moderna', 'CSM-87', '19729624-0'),
('CSFA-19', 'tOPV', 'CSM-91', '15936457-7'),
('CCSFAN-14', 'Fluarix Tetra', 'CSR-49', '16992005-2'),
('VM-19', 'Moderna', 'CSVIB-10', '26358122-9'),
('CCSFSPM-15', 'Twinrix', 'CSVL-80', '8516338-8'),
('CVSESA-13', 'tOPV', 'CSVL-80', '22413078-3'),
('CSFNSIC-18', 'Pfizer', 'CT-13', '9058099-k'),
('CSFT-19', 'Twinrix', 'CT-81', '9449197-5'),
('CSFVP-18', 'dTpa', 'CT-81', '23847392-6'),
('CCSFG-14', 'Moderna', 'CV-18', '27860788-7'),
('CSFER-10', 'Astrazeneca', 'CV-18', '20751066-1'),
('CSFL-15', 'dTpa', 'CV-18', '14561008-7'),
('VSPDA-21', 'Pfizer', 'CV-18', '16992005-2'),
('CSFR-17', 'Moderna', 'CVILC-34', '11944737-2'),
('CSFDAA-10', 'Moderna', 'CVILF-17', '26358122-9'),
('VI-11', 'Pfizer', 'CVILF-17', '17229934-2'),
('CCSFSL-17', 'Sinovac', 'CVIPA-67', '19908395-3'),
('CCSFA-12', 'Astrazeneca', 'HBSJO-15', '6574264-0'),
('HSJCC-17', 'Astrazeneca', 'HBSJO-15', '22602198-1'),
('CCSFSPM-15', 'Fluarix Tetra', 'HC-46', '10821584-4'),
('CSFA-12', 'tOPV', 'HC-46', '23680366-k'),
('CSFLQ-11', 'Tresvírica', 'HC-46', '21965856-7'),
('CCSFT-17', 'dTpa', 'HCMECDLVF-16', '23752945-6'),
('CSFCC-54', 'Sinovac', 'HCMECDLVF-16', '17941121-0'),
('CSFSJ-25', 'Sinovac', 'HCMECDLVF-16', '21839164-8'),
('CSMJ-13', 'Sinovac', 'HCMECDLVF-16', '21434350-9'),
('HCGPTL-12', 'Gardasil', 'HCMECDLVF-16', '19341368-4'),
('CSFEV-10', 'Astrazeneca', 'HCRV-11', '10682905-5'),
('CSFA-12', 'Twinrix', 'HCSB-12', '10121668-3'),
('CSFER-10', 'Astrazeneca', 'HCSB-12', '23936414-4'),
('HCSA-63', 'dTpa', 'HCSSA-37', '15936457-7'),
('CSFLB-16', 'Moderna', 'HCVM-16', '12972762-4'),
('CSFES-89', 'tOPV', 'HDETGI-53', '14561008-7'),
('HCSA-63', 'tOPV', 'HDETGI-53', '25701741-9'),
('CCSFY-17', 'Moderna', 'HDFBCSQN-26', '19368862-4'),
('CSFSV-19', 'BCG', 'HDFBCSQN-26', '5711662-5'),
('CCSFB-28', 'Pfizer', 'HDHHAT-16', '24520659-3'),
('CSFLB-16', 'Moderna', 'HDHHAT-16', '26989227-7'),
('CSFA-12', 'tOPV', 'HDSSP-31', '20699412-6'),
('VAH-10', 'BCG', 'HDSSP-31', '20923739-3'),
('VBS-16', 'Pfizer', 'HDTHM-10', '26314431-7'),
('VC-13', 'Astrazeneca', 'HDTHM-10', '16002227-2'),
('CSFSV-19', 'Tresvírica', 'HIA-19', '20699412-6'),
('CSFT-10', 'Twinrix', 'HP-25', '18100714-1'),
('CSFCC-54', 'Astrazeneca', 'HRR-60', '9596548-2'),
('CCSFDI-12', 'Twinrix', 'HSJDLS-99', '6574264-0'),
('CCSFG-14', 'Sinovac', 'HSJDLS-99', '20180166-4'),
('CSFO-14', 'Gardasil', 'HSJDLS-99', '8107082-2'),
('CSFPLG-12', 'Twinrix', 'HSJDLS-99', '12202561-6'),
('CSFVH-12', 'Sinovac', 'HSJDLS-99', '15702947-9'),
('CSMJ-13', 'Sinovac', 'HSJDLS-99', '22014791-6'),
('HCGPTL-12', 'Gardasil', 'IFV-76', '20923739-3'),
('CCSFSL-17', 'Astrazeneca', 'ILC-41', '19729624-0'),
('CSFDLF-56', 'tOPV', 'ILC-41', '8917057-5'),
('CSFVH-12', 'Moderna', 'ILC-41', '13596575-8'),
('VHN-15', 'BCG', 'ILC-41', '20180166-4'),
('CPEL-90', 'Tresvírica', 'IMA-12', '23752945-6'),
('CSFDFM-72', 'Tresvírica', 'IMA-12', '15702947-9'),
('CCSFY-17', 'Moderna', 'IMPS-29', '14028057-7'),
('CSFBL-19', 'Astrazeneca', 'IR-42', '9458119-2'),
('HCGPTL-12', 'BCG', 'IVM-86', '8567216-9'),
('VM-13', 'dTpa', 'NCC-72', '9596548-2'),
('CPEL-90', 'Twinrix', 'PI-13', '14978496-9'),
('CSFN-19', 'Moderna', 'PI-13', '8516338-8'),
('CMDM-18', 'Sinovac', 'PNPM-26', '25701741-9'),
('CCSFY-17', 'Moderna', 'PSMP-16', '9596548-2'),
('CSFDFM-72', 'Gardasil', 'PSMP-16', '13576291-1'),
('CSFL-15', 'dTpa', 'PSMP-16', '22413078-3');

-- --------------------------------------------------------

--
-- Table structure for table `VACUNA`
--

CREATE TABLE `VACUNA` (
  `Nombre_V` varchar(20) NOT NULL,
  `Enfermedad` varchar(30) DEFAULT NULL,
  `ID_C` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `VACUNA`
--

INSERT INTO `VACUNA` (`Nombre_V`, `Enfermedad`, `ID_C`) VALUES
('Astrazeneca', 'COVID-19', 'Dck-19'),
('BCG', 'Tuberculosis', 'Nya-16'),
('dTpa', 'Tétanos', 'Nya-16'),
('Fluarix Tetra', 'Influenza', 'Nya-16'),
('Gardasil', 'Virus papiloma humano', 'Hjw-19'),
('Moderna', 'COVID-19', 'Cuh-10'),
('Pfizer', 'COVID-19', 'Nya-16'),
('Sinovac', 'COVID-19', 'Zyn-16'),
('tOPV', 'Poliomielitis', 'Cuh-10'),
('Tresvírica', 'Sarampión', 'Lze-14'),
('Twinrix', 'Hepatitis B', 'Ydf-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CENTRO_DE_SALUD`
--
ALTER TABLE `CENTRO_DE_SALUD`
  ADD PRIMARY KEY (`ID_CS`);

--
-- Indexes for table `CONTAGIA`
--
ALTER TABLE `CONTAGIA`
  ADD PRIMARY KEY (`Nombre_E`,`Rut_P`),
  ADD KEY `Nombre_E` (`Nombre_E`,`Rut_P`),
  ADD KEY `Rut_P` (`Rut_P`);

--
-- Indexes for table `DIAGNOSTICO_MEDICO`
--
ALTER TABLE `DIAGNOSTICO_MEDICO`
  ADD PRIMARY KEY (`ID_D`),
  ADD KEY `RUT_PM` (`RUT_PM`);

--
-- Indexes for table `ENFERMEDAD`
--
ALTER TABLE `ENFERMEDAD`
  ADD PRIMARY KEY (`Nombre_E`);

--
-- Indexes for table `ENFERMERO`
--
ALTER TABLE `ENFERMERO`
  ADD PRIMARY KEY (`RUT_PM`),
  ADD KEY `RUT_PM` (`RUT_PM`);

--
-- Indexes for table `ES_CONTAGIADA_POR`
--
ALTER TABLE `ES_CONTAGIADA_POR`
  ADD PRIMARY KEY (`Rut_P`,`Rut_C`),
  ADD KEY `Rut_P` (`Rut_P`,`Rut_C`),
  ADD KEY `Rut_C` (`Rut_C`);

--
-- Indexes for table `MEDICO`
--
ALTER TABLE `MEDICO`
  ADD PRIMARY KEY (`RUT_PM`),
  ADD KEY `RUT_PM` (`RUT_PM`);

--
-- Indexes for table `PERSONA`
--
ALTER TABLE `PERSONA`
  ADD PRIMARY KEY (`Rut_P`),
  ADD KEY `RUT_PM` (`RUT_PM`);

--
-- Indexes for table `PERSONAL_MEDICO`
--
ALTER TABLE `PERSONAL_MEDICO`
  ADD PRIMARY KEY (`RUT_PM`);

--
-- Indexes for table `PRUEBA`
--
ALTER TABLE `PRUEBA`
  ADD PRIMARY KEY (`ID_P`),
  ADD KEY `RUT_PM` (`RUT_PM`);

--
-- Indexes for table `PUEDE_ASISTIR_A`
--
ALTER TABLE `PUEDE_ASISTIR_A`
  ADD PRIMARY KEY (`Rut_P`,`ID_CS`),
  ADD KEY `Rut_P` (`Rut_P`,`ID_CS`),
  ADD KEY `ID_CS` (`ID_CS`);

--
-- Indexes for table `PUNTO_DE_VACUNACION`
--
ALTER TABLE `PUNTO_DE_VACUNACION`
  ADD PRIMARY KEY (`ID_PV`,`Nombre_V`),
  ADD KEY `Nombre_V` (`Nombre_V`);

--
-- Indexes for table `SE_DIAGNOSTICA_A_TRAVES_DE`
--
ALTER TABLE `SE_DIAGNOSTICA_A_TRAVES_DE`
  ADD PRIMARY KEY (`Rut_P`,`ID_P`,`ID_D`),
  ADD KEY `Rut_P` (`Rut_P`,`ID_P`,`ID_D`),
  ADD KEY `ID_P` (`ID_P`),
  ADD KEY `ID_D` (`ID_D`);

--
-- Indexes for table `SE_DISTRIBUYE_EN`
--
ALTER TABLE `SE_DISTRIBUYE_EN`
  ADD PRIMARY KEY (`Nombre_V`,`ID_PV`),
  ADD KEY `Nombre_V` (`Nombre_V`,`ID_PV`),
  ADD KEY `ID_PV` (`ID_PV`);

--
-- Indexes for table `SE_EVITA_POR`
--
ALTER TABLE `SE_EVITA_POR`
  ADD PRIMARY KEY (`Nombre_E`,`Nombre_V`),
  ADD KEY `Nombre_E` (`Nombre_E`,`Nombre_V`),
  ADD KEY `Nombre_V` (`Nombre_V`);

--
-- Indexes for table `SE_INOCULA`
--
ALTER TABLE `SE_INOCULA`
  ADD PRIMARY KEY (`ID_PV`,`Rut_P`),
  ADD KEY `ID_PV` (`ID_PV`,`Rut_P`),
  ADD KEY `Rut_P` (`Rut_P`);

--
-- Indexes for table `SINTOMA`
--
ALTER TABLE `SINTOMA`
  ADD PRIMARY KEY (`Rut_P`),
  ADD KEY `Rut_P` (`Rut_P`);

--
-- Indexes for table `TRABAJA`
--
ALTER TABLE `TRABAJA`
  ADD PRIMARY KEY (`ID_PV`,`Nombre_V`,`ID_CS`,`RUT_PM`),
  ADD KEY `ID_PV` (`ID_PV`,`Nombre_V`,`ID_CS`,`RUT_PM`),
  ADD KEY `ID_CS` (`ID_CS`),
  ADD KEY `RUT_PM` (`RUT_PM`),
  ADD KEY `Nombre_V` (`Nombre_V`);

--
-- Indexes for table `VACUNA`
--
ALTER TABLE `VACUNA`
  ADD PRIMARY KEY (`Nombre_V`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CONTAGIA`
--
ALTER TABLE `CONTAGIA`
  ADD CONSTRAINT `CONTAGIA_ibfk_1` FOREIGN KEY (`Nombre_E`) REFERENCES `ENFERMEDAD` (`Nombre_E`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CONTAGIA_ibfk_2` FOREIGN KEY (`Rut_P`) REFERENCES `PERSONA` (`Rut_P`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `DIAGNOSTICO_MEDICO`
--
ALTER TABLE `DIAGNOSTICO_MEDICO`
  ADD CONSTRAINT `DIAGNOSTICO_MEDICO_ibfk_1` FOREIGN KEY (`RUT_PM`) REFERENCES `MEDICO` (`RUT_PM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ENFERMERO`
--
ALTER TABLE `ENFERMERO`
  ADD CONSTRAINT `ENFERMERO_ibfk_1` FOREIGN KEY (`RUT_PM`) REFERENCES `PERSONAL_MEDICO` (`RUT_PM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ES_CONTAGIADA_POR`
--
ALTER TABLE `ES_CONTAGIADA_POR`
  ADD CONSTRAINT `ES_CONTAGIADA_POR_ibfk_1` FOREIGN KEY (`Rut_C`) REFERENCES `PERSONA` (`Rut_P`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ES_CONTAGIADA_POR_ibfk_2` FOREIGN KEY (`Rut_P`) REFERENCES `PERSONA` (`Rut_P`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MEDICO`
--
ALTER TABLE `MEDICO`
  ADD CONSTRAINT `MEDICO_ibfk_1` FOREIGN KEY (`RUT_PM`) REFERENCES `PERSONAL_MEDICO` (`RUT_PM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PERSONA`
--
ALTER TABLE `PERSONA`
  ADD CONSTRAINT `PERSONA_ibfk_1` FOREIGN KEY (`RUT_PM`) REFERENCES `PERSONAL_MEDICO` (`RUT_PM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PRUEBA`
--
ALTER TABLE `PRUEBA`
  ADD CONSTRAINT `PRUEBA_ibfk_1` FOREIGN KEY (`RUT_PM`) REFERENCES `ENFERMERO` (`RUT_PM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PUEDE_ASISTIR_A`
--
ALTER TABLE `PUEDE_ASISTIR_A`
  ADD CONSTRAINT `PUEDE_ASISTIR_A_ibfk_1` FOREIGN KEY (`Rut_P`) REFERENCES `PERSONA` (`Rut_P`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PUEDE_ASISTIR_A_ibfk_2` FOREIGN KEY (`ID_CS`) REFERENCES `CENTRO_DE_SALUD` (`ID_CS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PUNTO_DE_VACUNACION`
--
ALTER TABLE `PUNTO_DE_VACUNACION`
  ADD CONSTRAINT `PUNTO_DE_VACUNACION_ibfk_1` FOREIGN KEY (`Nombre_V`) REFERENCES `VACUNA` (`Nombre_V`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SE_DIAGNOSTICA_A_TRAVES_DE`
--
ALTER TABLE `SE_DIAGNOSTICA_A_TRAVES_DE`
  ADD CONSTRAINT `SE_DIAGNOSTICA_A_TRAVES_DE_ibfk_1` FOREIGN KEY (`Rut_P`) REFERENCES `PERSONA` (`Rut_P`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SE_DIAGNOSTICA_A_TRAVES_DE_ibfk_2` FOREIGN KEY (`ID_P`) REFERENCES `PRUEBA` (`ID_P`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SE_DIAGNOSTICA_A_TRAVES_DE_ibfk_3` FOREIGN KEY (`ID_D`) REFERENCES `DIAGNOSTICO_MEDICO` (`ID_D`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SE_DISTRIBUYE_EN`
--
ALTER TABLE `SE_DISTRIBUYE_EN`
  ADD CONSTRAINT `SE_DISTRIBUYE_EN_ibfk_1` FOREIGN KEY (`Nombre_V`) REFERENCES `VACUNA` (`Nombre_V`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SE_DISTRIBUYE_EN_ibfk_2` FOREIGN KEY (`ID_PV`) REFERENCES `PUNTO_DE_VACUNACION` (`ID_PV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SE_EVITA_POR`
--
ALTER TABLE `SE_EVITA_POR`
  ADD CONSTRAINT `SE_EVITA_POR_ibfk_1` FOREIGN KEY (`Nombre_E`) REFERENCES `ENFERMEDAD` (`Nombre_E`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SE_EVITA_POR_ibfk_2` FOREIGN KEY (`Nombre_V`) REFERENCES `VACUNA` (`Nombre_V`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SE_INOCULA`
--
ALTER TABLE `SE_INOCULA`
  ADD CONSTRAINT `SE_INOCULA_ibfk_1` FOREIGN KEY (`ID_PV`) REFERENCES `PUNTO_DE_VACUNACION` (`ID_PV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SE_INOCULA_ibfk_2` FOREIGN KEY (`Rut_P`) REFERENCES `PERSONA` (`Rut_P`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SINTOMA`
--
ALTER TABLE `SINTOMA`
  ADD CONSTRAINT `SINTOMA_ibfk_1` FOREIGN KEY (`Rut_P`) REFERENCES `PERSONA` (`Rut_P`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `TRABAJA`
--
ALTER TABLE `TRABAJA`
  ADD CONSTRAINT `TRABAJA_ibfk_1` FOREIGN KEY (`ID_PV`) REFERENCES `PUNTO_DE_VACUNACION` (`ID_PV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TRABAJA_ibfk_3` FOREIGN KEY (`ID_CS`) REFERENCES `CENTRO_DE_SALUD` (`ID_CS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TRABAJA_ibfk_4` FOREIGN KEY (`RUT_PM`) REFERENCES `PERSONAL_MEDICO` (`RUT_PM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TRABAJA_ibfk_5` FOREIGN KEY (`Nombre_V`) REFERENCES `PUNTO_DE_VACUNACION` (`Nombre_V`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
1_BD_SALUD.sql
Mostrando 1_BD_SALUD.sql.
