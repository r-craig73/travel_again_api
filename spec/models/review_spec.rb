require 'rails_helper'

describe Review do
  it { should validate_presence_of :city }
  it { should validate_presence_of :comment }
end
