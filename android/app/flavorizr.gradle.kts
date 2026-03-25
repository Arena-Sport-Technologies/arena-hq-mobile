import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.arenasporttechnologies.arenahq.dev"
            resValue(type = "string", name = "app_name", value = "Arena HQ Development")
        }
        create("stg") {
            dimension = "flavor-type"
            applicationId = "com.arenasporttechnologies.arenahq.stg"
            resValue(type = "string", name = "app_name", value = "Arena HQ Staging")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.arenasporttechnologies.arenahq"
            resValue(type = "string", name = "app_name", value = "Arena HQ Production")
        }
    }
}