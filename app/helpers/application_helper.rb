module ApplicationHelper
  def full_title(page_title = '')
    base_title = "ReConnect"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def branch_options
    grouped_options = [
      ['Undergraduate',
       [
         ['Mechanical Engineering (ME)','me'],
         ['Electronics and Communication Engineering (EC)', 'ec'],
         ['Computer Science and Engineering (CS)', 'cs'],
         ['Electrical and Electronics Engineering (EE)', 'ee'],
         ['Telecommunication Engineering (TE)', 'te'],
         ['Information Science and Engineering (IS)', 'is'],
         ['Civil Engineering (CV)', 'cv']
       ]
      ],
      ['Postgraduate',
       [
         ['Masters in Computer Application (MCA)', 'mca'],
         ['Computer Science and Engineering (SCS)', 'scs'],
         ['Machine Design (MMD)', 'mmd']
       ]
      ]
    ]
  end
end
