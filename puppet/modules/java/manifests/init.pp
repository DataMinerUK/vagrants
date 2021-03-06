class java {

  include guardian

  File {
    owner => root,
    group => root,
    mode => 644
  }

  file {
    "/etc/profile.d/java.sh":
      source => "puppet:///modules/java/etc/profile.d/java.sh";
  }

  # OpenJDK because https://lists.ubuntu.com/archives/ubuntu-security-announce/2011-December/001528.html
  package {
    openjdk-6-jdk: ensure => present;
  }

  Class["guardian"] -> Package["openjdk-6-jdk"]
}