{ pkgs }: {
	deps = [
		pkgs.nodePackages.prettier
        pkgs.nano
        pkgs.ruby_3_0
        pkgs.rubyPackages_3_0.solargraph
        pkgs.rufo
        pkgs.sqlite
	];
}