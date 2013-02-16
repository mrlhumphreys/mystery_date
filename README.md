Mystery Date

How to use:

Rails:

Add `mystery_date` to your Gemfile.

If your class has a year, month and day method defined:

```
class Record < ActiveRecord::Base
  has_mystery_date
end
```

This will define a `date` method which will return the date if valid or nil, if not.

Or, if you have prefixed years months an days. (e.g. `birth_year`, `birth_month`, `birth_day`)

```
class Record < ActiveRecord::Base
  has_mystery_date :birth
end
```

This will define a `birth_date` method which will return the date if valid or nil, if not.

You can also define multiple date methods:

```
class Record < ActiveRecord::Base
  has_mystery_date :birth, :death, :wrath_of_khan
end
```

Validations are automatically included. The object will not be valid if the date is invalid. But, nil values for any of the date components are allowed.

