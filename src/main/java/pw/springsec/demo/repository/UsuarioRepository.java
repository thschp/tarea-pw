package pw.springsec.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


import pw.springsec.demo.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

	Optional<Usuario> findByUsername(String username);

}
