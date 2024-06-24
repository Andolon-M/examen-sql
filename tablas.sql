CREATE TABLE `tipo_medico` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL
);

CREATE TABLE `medico` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(15),
  `poblacion` VARCHAR(100),
  `provincia` VARCHAR(100),
  `codigo_postal` VARCHAR(10),
  `nif` VARCHAR(15) UNIQUE NOT NULL,
  `numero_seguridad_social` VARCHAR(20) UNIQUE NOT NULL,
  `numero_colegiado` VARCHAR(20) UNIQUE NOT NULL,
  `tipo_medico_id_fk` INT NOT NULL
);

CREATE TABLE `tipo_empleado` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL
);

CREATE TABLE `empleado` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(15),
  `poblacion` VARCHAR(100),
  `provincia` VARCHAR(100),
  `codigo_postal` VARCHAR(10),
  `nif` VARCHAR(15) UNIQUE NOT NULL,
  `numero_seguridad_social` VARCHAR(20) UNIQUE NOT NULL,
  `tipo_empleado_id_fk` INT NOT NULL
);

CREATE TABLE `horario_medico` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `medico_id` INT NOT NULL,
  `dia_semana` ENUM ('lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo') NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL
);

CREATE TABLE `sustitucion` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `medico_id` INT NOT NULL,
  `fecha_alta` DATE NOT NULL,
  `fecha_baja` DATE
);

CREATE TABLE `vacaciones_medico` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `medico_id` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL
);

CREATE TABLE `vacaciones_empleado` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `empleado_id` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE
);

CREATE TABLE `paciente` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(15),
  `codigo_postal` VARCHAR(10),
  `nif` VARCHAR(15) UNIQUE NOT NULL,
  `numero_seguridad_social` VARCHAR(20) UNIQUE NOT NULL,
  `medico_id` INT NOT NULL
);

CREATE TABLE `supervision` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `medico_id` INT NOT NULL,
  `empleado_id` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL
);

ALTER TABLE `supervision` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `supervision` ADD FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

ALTER TABLE `medico` ADD FOREIGN KEY (`tipo_medico_id_fk`) REFERENCES `tipo_medico` (`id`);

ALTER TABLE `empleado` ADD FOREIGN KEY (`tipo_empleado_id_fk`) REFERENCES `tipo_empleado` (`id`);

ALTER TABLE `horario_medico` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `sustitucion` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `vacaciones_medico` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `vacaciones_empleado` ADD FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);
