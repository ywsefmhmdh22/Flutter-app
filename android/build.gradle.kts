// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    kotlin("android") version "2.1.21" apply false
    id("com.android.application") version "8.7.0" apply false
    id("com.google.gms.google-services") version "4.4.2" apply false  // أضيف لدعم AdMob
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// هذا الجزء يبقى كما هو لأنه لإعدادات بناء Flutter
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}