# This if for front-end javascript side
ActiveAdminDatetimepicker::Base.default_datetime_picker_options = {
    defaultDate: proc { Time.current.strftime("%D/%M/%Y") }
}
# This if for backend(Ruby)
ActiveAdminDatetimepicker::Base.format = "%D/%M/%Y"