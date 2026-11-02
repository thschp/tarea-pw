package pw.springsec.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pw.springsec.demo.model.Usuario;
import pw.springsec.demo.repository.UsuarioRepository;


@Service
public class JpaUserService implements UserDetailsService {

	@Autowired
	private UsuarioRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario user = userRepository.findByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("Usuario " + "'"+ username + "' no encontrado."));

		List<GrantedAuthority> authorities = user.getRoles().stream()
				.map(role -> (GrantedAuthority) new SimpleGrantedAuthority(role.getName()))
				.toList();

		return org.springframework.security.core.userdetails.User.withUsername(user.getUsername())
				.password(user.getPassword())
				.disabled(!user.isEnabled())
				.authorities(authorities)
				.build();
	}

}