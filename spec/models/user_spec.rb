require 'rails_helper'

RSpec.describe User, :type => :model do

  it { should have_many(:ratings) }
  it { should have_many(:movies) }

end