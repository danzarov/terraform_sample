control "file_check" do
describe aws_s3_bucket(bucket_name: 'dannybucket99sss9') do
  it { should exist }
  it { should_not be_public }
end

describe aws_s3_bucket('dannybucket99sss9') do
  it { should exist }
end

describe aws_s3_bucket_object(bucket_name: 'dannybucket99sss9', key: 'test1.txt') do
  it { should exist }
  it { should_not be_public }
end

describe aws_s3_bucket_object(bucket_name: 'dannybucket99sss9', key: 'test2.txt') do
  it { should exist }
  it { should_not be_public }
end


end
