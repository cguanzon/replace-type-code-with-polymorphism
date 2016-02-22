require 'rspec'
require_relative '../classes/mountain_bike'

# # 0
# describe 'MountainBike' do
#   it 'creates a rigid type with a 2.5 tire width' do
#     bike = MountainBike.new(:type_code => :rigid, :tire_width => 2.5)
#     expect(bike.off_road_ability).to eq 1.5
#     expect(bike.price).to eq 315.0
#   end
#
#   it 'creates a front suspension bike with tire width 2 and front fork travel 3' do
#     bike = MountainBike.new(:type_code => :front_suspension, :tire_width => 2,
#                              :front_fork_travel => 3)
#     expect(bike.off_road_ability).to eq 2.7
#     expect(bike.price).to eq 515.0
#   end
# end

# # First
# describe 'MountainBike' do
#   it 'creates a rigid bike with a 2.5 tire width' do
#     bike = RigidMountainBike.new(:type_code => :rigid, :tire_width => 2.5)
#     expect(bike.off_road_ability).to eq 1.5
#     expect(bike.price).to eq 315.0
#   end
#
#   it 'creates a front suspension bike with tire width 2 and front fork travel 3' do
#     bike = FrontSuspensionMountainBike.new(:type_code => :front_suspension, :tire_width => 2,
#                                            :front_fork_travel => 3)
#     expect(bike.off_road_ability).to eq 2.7
#     expect(bike.price).to eq 515.0
#   end
# end

# Second and Third
describe 'MountainBike' do
  it 'creates a rigid bike with a 2.5 tire width' do
    bike = RigidMountainBike.new(:type_code => :rigid, :tire_width => 2.5)
    expect(bike.off_road_ability).to eq 1.5
    expect(bike.price).to eq 315.0
  end

  it 'creates a front suspension bike with tire width 2 and front fork travel 3' do
    bike = FrontSuspensionMountainBike.new(:type_code => :front_suspension, :tire_width => 2,
                                           :front_fork_travel => 3)
    expect(bike.off_road_ability).to eq 2.7
    expect(bike.price).to eq 515.0
  end
end