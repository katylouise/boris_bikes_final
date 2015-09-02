require 'container'
require 'support/shared_examples_for_container.rb'

class ContainerTest
  include Container
end

describe ContainerTest do
 it_behaves_like Container
end