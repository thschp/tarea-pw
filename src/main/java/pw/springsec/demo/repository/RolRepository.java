package pw.springsec.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


import pw.springsec.demo.model.Rol;

public interface RolRepository extends JpaRepository<Rol, Integer> {

	Optional<Rol> findByName(String name);

}