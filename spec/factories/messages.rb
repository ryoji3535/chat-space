FactoryGirl.define do

  factory :message do
          group_id  2
          user_id   1
          message {{
            text: "sample"
          }}
          initialize_with { attributes } 
  end

end
