name := "first"

version := "0.1"

scalaVersion := "2.12.12"

scalacOptions := Seq("-deprecation", "-Xsource:2.11")

resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.4.2"
libraryDependencies += "edu.berkeley.cs" %% "chisel-iotesters" % "1.5.1"
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.3.1"
