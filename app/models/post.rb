class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length:{minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in:["Fiction", "Non-Fiction"]}
    validate :cannot_be

    def cannot_be
        keywords = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        title_valid = false
        if title
            for keyword in keywords
                if title.match(keyword)
                    title_valid = true
                    break
                end
            end
        end
        
        if title_valid == false
            errors.add(:title, "Title must contain ${}")
        end

    end
end
