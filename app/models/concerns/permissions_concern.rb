module PermissionsConcern
	extend ActiveSupport::Concern

	def is_pueblo?
		#self hace referencia al objeto que esta incluyendo este módulo
		self.permission_level >= 4
	end

	def is_lider?
		self.permission_level >= 3
	end

	def is_altaDir?
		self.permission_level >= 2
	end

	def is_admin?
		self.permission_level >= 1
	end

end