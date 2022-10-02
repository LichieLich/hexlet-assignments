# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  versions1 = version1.split('.').map!(&:to_i)
  versions2 = version2.split('.').map!(&:to_i)
  versions1 <=> versions2
end
# END