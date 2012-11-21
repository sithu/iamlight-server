# The Application Mongoose model:
global.Application = mongoose.model 'Application', new Schema
    id: mongoose.Schema.ObjectId
    app_id:
        type: String
        validate: /.+/ 
    app_name:
        type: String
        validate: /.+/ 
    state:
        type: String
        default: 'pending'
    created_at:
        type: Date
        default: Date.now
    modified_at:
        type: Date