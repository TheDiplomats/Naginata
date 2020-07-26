#Metasploit
#red_riot
require 'msf/core'
class Metasploit5 < Msf::Auxiliary
	include Msf::Exploit::Remote::Tcp
	include Msf::Auxiliary::Scanner

	def initialize
		super(
			'Name' => 'My custom TCP scan',
			'Version' => '$Revision: 1 $',
			'Description' => 'My quick scanner',
			'Author' => 'Red Riot',
			'License' => MSF_LICENSE
		)
		register_options(
			[
				Opt::RPORT(12345)
			], self.class)
	end

	def run_host(ip)
		connect()
		sock.puts('HELLO SERVER')
		data = sock.recv(1024)
		print_status("Received: #{data} from #{ip}")
		disconnect()
	end

end
