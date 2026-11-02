package pw.springsec.demo.config;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import pw.springsec.demo.model.Rol;
import pw.springsec.demo.model.Usuario;
import pw.springsec.demo.repository.RolRepository;
import pw.springsec.demo.repository.UsuarioRepository;

@Component
public class DataInitializer implements CommandLineRunner {

	@Autowired
	private RolRepository roleRepository;

	@Autowired
	private UsuarioRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void run(String... args) {
		Rol user = crearRol("USER");
		Rol creator = crearRol("CREATOR");
		Rol editor = crearRol("EDITOR");
		Rol admin = crearRol("ADMIN");

		crearUsuario("admin", "admin123", Set.of(admin));
		crearUsuario("creator", "creator123", Set.of(creator));
		crearUsuario("editor", "editor123", Set.of(editor));
		crearUsuario("user", "user123", Set.of(user));
		crearUsuario("test", "test123", Set.of(user, creator, editor));
	}

	private Rol crearRol(String name) {
		return roleRepository.findByName(name).orElseGet(() -> roleRepository.save(new Rol(null, name)));
	}

	private void crearUsuario(String username, String password, Set<Rol> roles) {
		if (userRepository.findByUsername(username).isEmpty()) {
			userRepository.save(new Usuario(null, username, passwordEncoder.encode(password), true, roles));
		}
	}

}
