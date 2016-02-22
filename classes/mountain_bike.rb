# # 0: Original
#
# class MountainBike
#   TIRE_WIDTH_FACTOR = 0.6
#   FRONT_SUSPENSION_FACTOR = 0.5
#   REAR_SUSPENSION_FACTOR = 0.4
#
#   def initialize(params)
#     params.each { |key, value| instance_variable_set "@#{key}", value }
#     @base_price ||= 300
#     @front_suspension_price ||= 200
#     @rear_suspension_price ||= 100
#     @commission ||= 0.05
#     @rear_fork_travel ||= 1.1
#     @front_fork_travel ||= 0.8
#   end
#
#   def off_road_ability
#     result = @tire_width * TIRE_WIDTH_FACTOR
#     if @type_code == :front_suspension || @type_code == :full_suspension
#       result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
#     end
#     if @type_code == :full_suspension
#       result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
#     end
#     result
#   end
#
#   def price
#     case @type_code
#     when :rigid
#       (1 + @commission) * @base_price
#     when :front_suspension
#       (1 + @commission) * @base_price + @front_suspension_price
#     when :full_suspension
#       (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
#     end
#   end
# end



# # First: Create a Class for Each Type, Change the Class that uses the type code into a module
#
# module MountainBike
#   TIRE_WIDTH_FACTOR = 0.6
#   FRONT_SUSPENSION_FACTOR = 0.5
#   REAR_SUSPENSION_FACTOR = 0.4
#
#   def initialize(params)
#     params.each { |key, value| instance_variable_set "@#{key}", value }
#     @base_price ||= 300
#     @front_suspension_price ||= 200
#     @rear_suspension_price ||= 100
#     @commission ||= 0.05
#     @rear_fork_travel ||= 1.1
#     @front_fork_travel ||= 0.8
#   end
#
#   def off_road_ability
#     result = @tire_width * TIRE_WIDTH_FACTOR
#     if @type_code == :front_suspension || @type_code == :full_suspension
#       result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
#     end
#     if @type_code == :full_suspension
#       result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
#     end
#     result
#   end
#
#   def price
#     case @type_code
#       when :rigid
#         (1 + @commission) * @base_price
#       when :front_suspension
#         (1 + @commission) * @base_price + @front_suspension_price
#       when :full_suspension
#         (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
#     end
#   end
# end

# class RigidMountainBike
#   include MountainBike
# end
#
# class FrontSuspensionMountainBike
#   include MountainBike
# end
#
# class FullSuspensionMountainBike
#   include MountainBike
# end



# # Second override the polymorphic methods in the new classes
#
# module MountainBike
#   TIRE_WIDTH_FACTOR = 0.6
#   FRONT_SUSPENSION_FACTOR = 0.5
#   REAR_SUSPENSION_FACTOR = 0.4
#
#   def initialize(params)
#     params.each { |key, value| instance_variable_set "@#{key}", value }
#     @base_price ||= 300
#     @front_suspension_price ||= 200
#     @rear_suspension_price ||= 100
#     @commission ||= 0.05
#     @rear_fork_travel ||= 1.1
#     @front_fork_travel ||= 0.8
#   end
#
#   def off_road_ability
#     result = @tire_width * TIRE_WIDTH_FACTOR
#     if @type_code == :front_suspension || @type_code == :full_suspension
#       result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
#     end
#     if @type_code == :full_suspension
#       result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
#     end
#     result
#   end
#
#   def price
#     case @type_code
#       when :rigid
#         (1 + @commission) * @base_price
#       when :front_suspension
#         (1 + @commission) * @base_price + @front_suspension_price
#       when :full_suspension
#         (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
#     end
#   end
# end
#
# class RigidMountainBike
#   include MountainBike
#
#   def off_road_ability
#     @tire_width * TIRE_WIDTH_FACTOR
#   end
#
#   def price
#     (1 + @commission) * @base_price
#   end
# end
#
# class FrontSuspensionMountainBike
#   include MountainBike
#
#   def off_road_ability
#     @tire_width * TIRE_WIDTH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR
#   end
#
#   def price
#     (1 + @commission) * @base_price + @front_suspension_price
#   end
# end
#
# class FullSuspensionMountainBike
#   include MountainBike
#
#   def off_road_ability
#     @tire_width * TIRE_WIDTH_FACTOR +
#     @front_fork_travel * FRONT_SUSPENSION_FACTOR +
#     @rear_fork_travel * REAR_SUSPENSION_FACTOR
#   end
#
#   def price
#     (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
#   end
# end

# Third remove unneeded methods from the module, or delete the module of totally unneeded

module MountainBike
  TIRE_WIDTH_FACTOR = 0.6
  FRONT_SUSPENSION_FACTOR = 0.5
  REAR_SUSPENSION_FACTOR = 0.4

  def initialize(params)
    params.each { |key, value| instance_variable_set "@#{key}", value }
    @base_price ||= 300
    @front_suspension_price ||= 200
    @rear_suspension_price ||= 100
    @commission ||= 0.05
    @rear_fork_travel ||= 1.1
    @front_fork_travel ||= 0.8
  end
end

class RigidMountainBike
  include MountainBike

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR
  end

  def price
    (1 + @commission) * @base_price
  end
end

class FrontSuspensionMountainBike
  include MountainBike

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end
end

class FullSuspensionMountainBike
  include MountainBike

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR +
        @front_fork_travel * FRONT_SUSPENSION_FACTOR +
        @rear_fork_travel * REAR_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
  end
end