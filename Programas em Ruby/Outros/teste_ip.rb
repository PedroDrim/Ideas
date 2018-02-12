    require 'socket'
#METHOD 1
    ip = IPSocket.getaddress(Socket.gethostname)
    puts ip 

#METHOD 2
    host = Socket.gethostname
    puts host

#METHOD 3(uses Google's address)
    ip = UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
    puts ip

#METHOD 4(uses gateway address)
    def local_ip
      orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily

      UDPSocket.open do |s|
        s.connect '192.168.1.1', 1
        s.addr.last
      end
    ensure
      Socket.do_not_reverse_lookup = orig
    end

    ip=local_ip
    puts ip